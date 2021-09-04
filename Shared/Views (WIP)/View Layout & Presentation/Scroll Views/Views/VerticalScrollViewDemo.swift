//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

struct VerticalScrollViewDemo: View {

  @EnvironmentObject private var viewModel: ScrollViewDemoViewModel
  private let columns: [GridItem] = [GridItem(.adaptive(minimum: 80))]

  var body: some View {
    ScrollView(showsIndicators: viewModel.showsIndicators) {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(0...250, id: \.self, content: LazyGridsCell.init)
      }
    }
  }
}
