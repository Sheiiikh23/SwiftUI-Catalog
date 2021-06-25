//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

struct LazyHGridConfiguratorView: View {

  @EnvironmentObject private var viewModel: LzayHGridDemoViewModel

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
          Stepper("GridItem count : \(Int(viewModel.gridItemCount))", value: $viewModel.gridItemCount, in: 0...10)
          Picker("Grid alignment", selection: $viewModel.gridItemAlignmentcustom) {
            ForEach(VerticalAlignmentCustom.allCases, id: \.self) { alignment in
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
