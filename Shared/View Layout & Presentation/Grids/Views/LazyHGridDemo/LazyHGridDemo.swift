//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

struct LazyHGridDemo: View {

  @EnvironmentObject var viewModel: LazyHGridDemoViewModel

  var body: some View {
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
  }
}
