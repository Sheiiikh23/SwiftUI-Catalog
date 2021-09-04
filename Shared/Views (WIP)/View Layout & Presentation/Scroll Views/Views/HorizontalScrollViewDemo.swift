//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

struct HorizontalScrollViewDemo: View {
  
  @EnvironmentObject private var viewModel: ScrollViewDemoViewModel
  private let rows: [GridItem] = [GridItem(.adaptive(minimum: 80))]
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: viewModel.showsIndicators) {
      LazyHGrid(rows: rows, spacing: 20) {
        ForEach(0...250, id: \.self, content: LazyGridsCell.init)
      }
    }
  }
}
