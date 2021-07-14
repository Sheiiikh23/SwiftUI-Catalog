//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Une `View` qui arrange ses subviews dans une grille de manière horizontale, créant chaque subview à la volée et si nécessaire (d'où le lazy)
///
/// 1 init pour une `LazyHGrid` :
///   - init(rows: [GridItem], alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content) where Content : View
///
/// Paramètres :
///   - rows : `[GridItem]` ––> un array de `GridItem` pour dimensionner et positionner chaque row de la grille
///   - alignment: `VerticalAlignment` = .center ––> l'alignement vertical de chaque subview
///       - top
///       - center
///       - bottom
///       - firstTextBaseline
///       - lastTextBaseline
///   - spacing: `CGFloat?` = nil ––> la distance horizontal entre chaque subview, `nil` pour une valeur par défaut
///   - pinnedViews: `PinnedScrollableViews` = .init() ––> les types de subviews qui vont être épinglés
///       - sectionHeaders : rend le header d'une `Section` sticky
///       - sectionFooters : rend le footer d'une `Section` sticky
///   - @ViewBuilder content: () -> Content ––> un ensemble de `View` (maximum 10 subviews)
///
/// Remarques :
///   - Une `LazyHGrid` place un ensemble de cellules horizontalement, les cellules disposées en columns (cf vidéo)
///   - `onAppear` & `onDisappear` bien appellé à chaque fois (et pas qu'à la création de la cellule)
///   - À 99.99% du temps précédée par une `ScrollView`, puis suivie d'un `ForEach`
///
/// Vidéo : https://swiftui-lab.com/wp-content/uploads/2020/07/layouts.mp4

fileprivate enum TabItem {
  case settings
  case grid
  case sample
}

struct LazyHGridDemoView: View {

  @StateObject private var viewModel = LazyHGridDemoViewModel()

  var body: some View {
    TabView {
      LazyHGridConfiguratorView()
        .tag(TabItem.settings)
        .tabItem { Label("Config", systemImage: "gear") }

      LazyHGridDemo()
        .onAppear { viewModel.objectWillChange.send() }
        .tag(TabItem.grid)
        .tabItem { Label("Grid", systemImage: "square.grid.3x2") }

      LazyHGridSamples()
        .tag(TabItem.sample)
        .tabItem { Label("Samples", systemImage: "magazine") }
    }
    .environmentObject(viewModel)
  }
}

struct LazyHGridConfiguratorView: View {

  @EnvironmentObject private var viewModel: LazyHGridDemoViewModel

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
          LazyHGridGridItemSizeConfiguratorView()
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
            ForEach(VerticalAlignmentCustom.allCases) { alignment in
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

struct LazyHGridDemo: View {

  @EnvironmentObject var viewModel: LazyHGridDemoViewModel

  var body: some View {
    NavigationView {
      ScrollView(.horizontal) {
        LazyHGrid(rows: Array(repeating: GridItem(viewModel.itemType, spacing: viewModel.itemSpacing, alignment: viewModel.itemAlignment), count: viewModel.gridItemCount),
                  alignment: viewModel.gridAlignment, spacing: viewModel.gridSpacing,
                  pinnedViews: viewModel.gridShowPinnedViews ? [.sectionHeaders, .sectionFooters] : .init()) {
          Section(header: HeaderAndFooterPinnedView(title: "1 to 250"),
                  footer: HeaderAndFooterPinnedView(title: "1 to 250")) {
            ForEach(1...500, id: \.self) { item in
              LazyGridCellDemo(alignment: $viewModel.itemAlignment, item: item)
                .frame(width: viewModel.itemSize * 0.75 , height: viewModel.itemSize)
            }
          }
        }
      }
      .background(Color.mint.opacity(0.25))
      .navigationTitle("LazyHGrid demo")
    }
  }
}

struct LazyHGridSamples: View {

  var body: some View {
    NavigationView {
      List {
        NavigationLink("N-Adaptive Rows", destination: LazyHGridWithNAdaptiveRows())
        NavigationLink("One Flexible Row", destination: LazyHGridWithOneFlexibleRow())
        NavigationLink("Three Flexible Rows", destination: LazyHGridWithThreeFlexibleRows())
        NavigationLink("Three Fixed Rows", destination: LazyHGridWithThreeFixedRows())
        NavigationLink("One Fixed – ß Adaptive – One Flexible Rows", destination: LazyHGridWithOneFixedßAdaptiveOneFlexibleRows())
      }
      .navigationTitle("LazyHGrid Samples")
    }
  }
}

struct LazyHGridWithNAdaptiveRows: View {

  /// Définition du layout :
  ///   - `GridItem` : .adaptative(minimum: 80, maximum: .infinity), spacing: nil, alignment: nil
  ///   - rows : x rows d'au moins 80 points en height (x s'adapte en fonction de l'orientation du device)
  let rows = [GridItem(.adaptive(minimum: 80))]

  @State private var gridHeight: CGFloat = 500

  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows, spacing: 20) {
        ForEach(0...250, id: \.self, content: LazyGridsCell.init)
      }
      .frame(height: gridHeight)
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        Slider(value: $gridHeight, in: 80...(UIScreen.main.bounds.height - 125))
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .background(Color.mint.opacity(0.25))
  }
}

struct LazyHGridWithOneFlexibleRow: View {

  /// Définition du layout :
  ///   - `GridItem` : .flexible(minimum: 10, maximum: .infinity), spacing: nil, alignment: nil
  ///   - rows : 1 seule row qui prend toute la height de la `LazyHGrid`
  let rows = [GridItem(.flexible())]

  @State private var gridHeight: CGFloat = 500

  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows, spacing: 20) {
        ForEach(1...250, id: \.self, content: LazyGridsCell.init)
      }
      .frame(height: gridHeight)
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        Slider(value: $gridHeight, in: 50...(UIScreen.main.bounds.height - 125))
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .background(Color.mint.opacity(0.25))
  }
}

struct LazyHGridWithThreeFlexibleRows: View {

  /// Définition du layout :
  ///   - `GridItem` : .flexible(minimum: 10, maximum: .infinity), spacing: nil, alignment: nil
  ///   - rows : 3 rows qui font ± 1/3 de la height de `LazyHGrid`
  let rows = Array(repeating: GridItem(.flexible()), count: 3)

  @State private var gridHeight: CGFloat = 500

  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows, spacing: 20) {
        ForEach(1...250, id: \.self, content: LazyGridsCell.init)
      }
      .frame(height: gridHeight)
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        Slider(value: $gridHeight, in: 50...(UIScreen.main.bounds.height - 125))
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .background(Color.mint.opacity(0.25))
  }
}

struct LazyHGridWithThreeFixedRows: View {

  /// Définition du layout :
  ///   - `GridItem` : .fixed(200), spacing: nil, alignment: nil
  ///   - rows : 3 rows qui font précicément 200 points de height chacune
  let rows = Array(repeating: GridItem(.fixed(200)), count: 3)

  @State private var gridHeight: CGFloat = 610

  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows, spacing: 20) {
        ForEach(1...250, id: \.self, content: LazyGridsCell.init)
      }
      .frame(height: gridHeight)
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        Slider(value: $gridHeight, in: 610...(UIScreen.main.bounds.height - 125))
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .background(Color.mint.opacity(0.25))
  }
}

struct LazyHGridWithOneFixedßAdaptiveOneFlexibleRows: View {

  /// Définition du layout :
  ///   - `GridItem` :
  ///       - .fixed(200), spacing: nil, alignment: nil
  ///       - .adaptive(minimum: 100, maximum: 250), spacing: nil, alignment: nil – xß
  ///       - .flexible(minimum: 10, maximum: .infinity), spacing: nil, alignment: nil
  ///   - rows : 2 + ß rows qui vont faire :
  ///       - fixe 200 points de height
  ///       - entre 100 et 250 point de height x ß
  ///       - entre 10 et toute la height restante
  let row = [
    GridItem(.fixed(200)),
    GridItem(.adaptive(minimum: 100, maximum: 250)),
    GridItem(.flexible())
  ]

  @State private var gridHeight: CGFloat = 500

  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: row, spacing: 20) {
        ForEach(1...250, id: \.self, content: LazyGridsCell.init)
      }
      .frame(height: gridHeight)
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        Slider(value: $gridHeight, in: 410...(UIScreen.main.bounds.height - 125))
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .background(Color.mint.opacity(0.25))
  }
}

struct LazyHGrid_Previews: PreviewProvider {
  static var previews: some View {
    LazyHGridDemoView()
    LazyHGridConfiguratorView()
    LazyHGridDemo()
    LazyHGridSamples()
    LazyHGridWithNAdaptiveRows()
    LazyHGridWithOneFlexibleRow()
    LazyHGridWithThreeFlexibleRows()
    LazyHGridWithThreeFixedRows()
    LazyHGridWithOneFixedßAdaptiveOneFlexibleRows()
  }
}
