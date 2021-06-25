//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

struct LzayHGridDemo: View {

  @EnvironmentObject var viewModel: LzayHGridDemoViewModel

  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: Array(repeating: GridItem(viewModel.itemType, spacing: viewModel.itemSpacing, alignment: viewModel.itemAlignment), count: viewModel.gridItemCount),
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
              Text("Item n°\(item)")
                .fontWeight(.bold)
                .foregroundColor(.white)
            }
            .frame(width: viewModel.itemSize)
          }
        }
      }
    }
  }
}
