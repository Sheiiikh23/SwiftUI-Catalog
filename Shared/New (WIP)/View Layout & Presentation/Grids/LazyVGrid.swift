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

fileprivate enum TabItem {
  case settings
  case grid
  case sample
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
        .tag(TabItem.sample)
        .tabItem { Label("Samples", systemImage: "magazine") }
    }
    .environmentObject(viewModel)
  }
}

struct LazyVGridSamples: View {

  var body: some View {
    NavigationView {
      List {
        NavigationLink("N-Adaptive Columns", destination: LazyVGridWithNAdaptiveColumns())
        NavigationLink("One Flexible Column", destination: LazyVGridWithOneFlexibleColumn())
        NavigationLink("Three Flexible Columns", destination: LazyVGridWithThreeFlexibleColumns())
        NavigationLink("Three Fixed Columns", destination: LazyVGridWithThreeFixedColumns())
        NavigationLink("One Fixed – ß Adaptive – One Flexible Columns", destination: LazyVGridWithOneFixedßAdaptiveOneFlexibleColums())
      }
      .navigationTitle("LazyVGrid Samples")
    }
  }
}

struct LazyVGridView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LazyVGridWithNAdaptiveColumns()
      LazyVGridWithOneFlexibleColumn()
      LazyVGridWithThreeFlexibleColumns()
      LazyVGridWithThreeFixedColumns()
      LazyVGridWithOneFixedßAdaptiveOneFlexibleColums()
    }
  }
}
