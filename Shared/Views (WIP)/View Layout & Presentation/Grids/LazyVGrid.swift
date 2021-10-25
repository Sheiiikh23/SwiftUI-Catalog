//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Une `View` qui arrange ses subviews dans une grille de manière verticale, créant chaque subview à la volée et si nécessaire (d'où le lazy)
///
/// 1 init pour une `LazyVGrid` :
///   - init(columns: [GridItem], alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content) where Content : View
///
/// Paramètres :
///   - columns : `[GridItem]` ––> un array de `GridItem` pour dimensionner et positionner chaque column de la grille
///   - alignment : `HorizontalAlignment` = .center ––> l'alignment horizontal de chaque subview
///       - leading
///       - center
///       - trailing
///   - spacing : `CGFloat?` = nil –> la distance vertical entre chaque subview, `nil` pour une valeur par défaut
///   - pinnedViews: `PinnedScrollableViews` = .init() ––> les types de subviews qui vont être épinglés
///       - sectionHeaders : rend le header d'une `Section` sticky
///       - sectionFooters : rend le footer d'une `Section` sticky
///   - @ViewBuilder content: () -> Content ––> un ensemble de `View` (maximum 10 subviews)
///
/// Remarques :
///   - Une `LazyVGrid` place un ensemble de cellules verticalement, les celles disposées en rows (cf vidéo)
///   - `onAppear` & `onDisappear` bien appellé à chaque fois (et pas qu'à la création de la cellule)
///   - À 99.99% du temps précédée par une `ScrollView`, puis suivie d'un `ForEach`
///
/// Vidéo : https://swiftui-lab.com/wp-content/uploads/2020/07/layouts.mp4

fileprivate enum TabItem {
  case settings
  case grid
  case samples
}

struct LazyVGridDemoView: View {

  @StateObject private var viewModel = LazyVGridDemoViewModel()

  var body: some View {
    TabView {
      LazyVGridConfiguratorView()
        .tag(TabItem.settings)
        .tabItem { Label("Config", systemImage: "gear") }

      LazyVGridDemo()
        .tag(TabItem.grid)
        .tabItem { Label("Grid", systemImage: "square.grid.3x2") }

      LazyVGridSamples()
        .tag(TabItem.samples)
        .tabItem { Label("Samples", systemImage: "magazine") }
    }
    .environmentObject(viewModel)
  }
}

struct LazyVGridConfiguratorView: View {

  @EnvironmentObject private var viewModel: LazyVGridDemoViewModel

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("GridItem Config")) {
          Picker("GridItem type", selection: $viewModel.itemCustomType) {
            ForEach(GridItemType.allCases) { type in
              Text(gridItemDescription(for: type).firstLetterCapitalized)
                .tag(type)
                .multilineTextAlignment(.center)
            }
          }
          LazyVGridGridItemSizeConfiguratorView()
          VStack {
            Text("GridItem spacing : \(Int(viewModel.itemSpacing))")
            Slider(value: $viewModel.itemSpacing, in: 0...50)
          }
          Picker("GridItem alignment", selection: $viewModel.itemAlignmentCustom) {
            ForEach(AlignmentCustom.allCases) { alignment in
              Text(alignment.description.firstLetterCapitalized)
                .tag(alignment)
            }
          }
        }
        .listRowSeparatorTint(.red)

        Section(header: Text("Grid Config")) {
          if viewModel.itemCustomType != .adaptive {
            Stepper("GridItem count : \(Int(viewModel.gridItemCount))", value: $viewModel.gridItemCount, in: 0...10)
          }
          Picker("Grid alignment", selection: $viewModel.gridItemAlignmentcustom) {
            ForEach(HorizontalAlignmentCustom.allCases, id: \.self) { alignment in
              Text(alignment.description.firstLetterCapitalized)
                .tag(alignment)
            }
          }
          VStack {
            Text("Grid spacing : \(Int(viewModel.gridSpacing))")
            Slider(value: $viewModel.gridSpacing, in: 0...50)
          }
          Toggle("Grid show pinnedViews ? \(viewModel.gridShowPinnedViews.description.firstLetterCapitalized)", isOn: $viewModel.gridShowPinnedViews)
            .toggleStyle(SwitchToggleStyle(tint: .mint))
        }
        .listRowSeparatorTint(.yellow)
      }
      .navigationTitle("Grid Configurator ⚙")
    }
  }
  private func gridItemDescription(for type: GridItemType) -> String {
    switch type {
    case .adaptive:
      return "adaptive(min : \(Int(viewModel.itemMinSize)), max : \(Int(viewModel.itemMaxSize)))"
    case .fixed:
      return "fixed \(Int(viewModel.itemSize))"
    case .flexible:
      return "flexible(min : \(Int(viewModel.itemMinSize)), max : \(Int(viewModel.itemMaxSize)))"
    }
  }
}

struct LazyVGridDemo: View {

  @EnvironmentObject private var viewModel: LazyVGridDemoViewModel

  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(columns: Array(repeating: GridItem(viewModel.itemType, spacing: viewModel.itemSpacing, alignment: viewModel.itemAlignment),
                                 count: viewModel.gridItemCount),
                  alignment: viewModel.gridAlignment, spacing: viewModel.gridSpacing,
                  pinnedViews: viewModel.gridShowPinnedViews ? [.sectionHeaders, .sectionFooters] : .init()) {
          Section(header: HeaderAndFooterPinnedView(title: "1 to 250"),
                  footer: HeaderAndFooterPinnedView(title: "1 to 250")) {
            ForEach(1...500, id: \.self) { item in
              ZStack(alignment: viewModel.itemAlignment) {
                randomColor()
                Rectangle()
                  .fill(.black)
                  .frame(width: viewModel.itemSize * 0.75, height: viewModel.itemSize * 0.75)
                  .onChange(of: viewModel.itemSize) {
                    print("====", $0, $0 * 0.75)
                  }
                  .padding()
                Text("Item n°\(item)")
                  .fontWeight(.bold)
                  .foregroundColor(.white)
              }
              .frame(width: viewModel.itemSize)
            }
          }
        }
      }
      .navigationTitle("LazyVGrid demo")
    }
  }
}

fileprivate enum Sample: String, Identifiable, CaseIterable {
  case nAdaptive = "N-Adaptive Columns"
  case oneFlexible = "One Flexible Column"
  case threeFlexible = "Three Flexible Columns"
  case threeFixed = "Three Fixed Columns"
  case oneFixedßAdaptiveOneFlexible = "One Fixed – ß Adaptive – One Flexible Columns"
  
  var id: String { rawValue }
  
  @ViewBuilder var destination: some View {
    switch self {
    case .nAdaptive:
      NavigationLink(rawValue, destination: LazyVGridWithNAdaptiveColumns())
    case .oneFlexible:
      NavigationLink(rawValue, destination: LazyVGridWithOneFlexibleColumn())
    case .threeFlexible:
      NavigationLink(rawValue, destination: LazyVGridWithThreeFlexibleColumns())
    case .threeFixed:
      NavigationLink(rawValue, destination: LazyVGridWithThreeFixedColumns())
    case .oneFixedßAdaptiveOneFlexible:
      NavigationLink(rawValue, destination: LazyVGridWithOneFixedßAdaptiveOneFlexibleColums())
    }
  }
}

struct LazyVGridSamples: View {

  var body: some View {
    NavigationView {
      List {
        ForEach(Sample.allCases, content: \.destination)
      }
      .navigationTitle("LazyVGrid Samples")
    }
  }
}

struct LazyVGridWithNAdaptiveColumns: View {

  /// Définition du layout :
  ///   - `GridItem` : .adaptative(minimum: 80, maximum: .infinity), spacing: nil, alignment: nil
  ///   - columns : x columns d'au moins 80 points en width (x s'adapte en fonction de l'orientation du device)
  let columns = [GridItem(.adaptive(minimum: 80))]

  @State private var gridWidth: CGFloat = 100

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(0...250, id: \.self, content: LazyGridsCell.init)
      }
      .frame(width: gridWidth)
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        Slider(value: $gridWidth, in: 80...UIScreen.main.bounds.width)
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .background(Color.mint.opacity(0.25))
  }
}

struct LazyVGridWithOneFlexibleColumn: View {

  /// Définition du layout :
  ///   - `GridItem` : .flexible(minimum: 10, maximum: .infinity), spacing: nil, alignment: nil
  ///   - columns : 1 seule colonne qui prend toute la width de la `LazyVGrid
  let columns = [GridItem(.flexible())]

  @State private var gridWidth: CGFloat = 100

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(0...250, id: \.self, content: LazyGridsCell.init)
      }
      .frame(width: gridWidth)
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        Slider(value: $gridWidth, in: 80...UIScreen.main.bounds.width)
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .background(Color.mint.opacity(0.25))
  }
}

struct LazyVGridWithThreeFlexibleColumns: View {

  /// Définition du layout :
  ///   - `GridItem` : .flexible(minimum: 10, maximum: .infinity), spacing: nil, alignment: nil
  ///   - columns : 3 columns qui font ± 1/3 de la width de la `LazyVGrid`
  let columns = Array(repeating: GridItem(.flexible()), count: 3)

  @State private var gridWidth: CGFloat = 100

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(0...250, id: \.self, content: LazyGridsCell.init)
      }
      .frame(width: gridWidth)
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        Slider(value: $gridWidth, in: 80...UIScreen.main.bounds.width)
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .background(Color.mint.opacity(0.25))
  }
}

struct LazyVGridWithThreeFixedColumns: View {

  /// Définition du layout :
  ///   - `GridItem` : .fixed(75), spacing: nil, alignment: nil
  ///   - columns : 3 columns qui font précicément 75 points de width chacunes
  let columns = Array(repeating: GridItem(.fixed(75)), count: 3)

  @State private var gridWidth: CGFloat = 225

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(0...250, id: \.self, content: LazyGridsCell.init)
      }
      .frame(width: gridWidth)
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        Slider(value: $gridWidth, in: 225...UIScreen.main.bounds.width)
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .background(Color.mint.opacity(0.25))
  }
}

struct LazyVGridWithOneFixedßAdaptiveOneFlexibleColums: View {

  /// Définition du layout :
  ///   - `GridItem` :
  ///       - .fixed(75), spacing: nil, alignment: nil
  ///       - .adaptive(minimum: 40, maximum: 60), spacing: nil, alignment: nil – xß
  ///       - .flexible(minimum: 10, maximum: .infinity), spacing: nil, alignment: nil
  ///   - columns : 2 + ß columns qui vont faire :
  ///       - fixe 75 points de width
  ///       - entre 40 et 60 point de width x ß
  ///       - entre 10 et toute la width restante
  let columns = [
    GridItem(.fixed(75)),
    GridItem(.adaptive(minimum: 40, maximum: 60)),
    GridItem(.flexible())
  ]

  @State private var gridWidth: CGFloat = 225

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(0...250, id: \.self, content: LazyGridsCell.init)
      }
      .frame(width: gridWidth)
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        Slider(value: $gridWidth, in: 225...UIScreen.main.bounds.width)
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .background(Color.mint.opacity(0.25))
  }
}

struct LazyVGridView_Previews: PreviewProvider {
  static var previews: some View {
    LazyVGridDemoView()
    LazyVGridConfiguratorView()
    LazyVGridDemo()
    LazyVGridSamples()
    LazyVGridWithNAdaptiveColumns()
    LazyVGridWithOneFlexibleColumn()
    LazyVGridWithThreeFlexibleColumns()
    LazyVGridWithThreeFixedColumns()
    LazyVGridWithOneFixedßAdaptiveOneFlexibleColums()
  }
}
