//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

struct LazyVGridGridItemSizeConfiguratorView: View {

  @EnvironmentObject var viewModel: LazyVGridDemoViewModel

  var body: some View {
    if viewModel.showMinMaxSize {
      VStack {
        Text("GridItem min size : \(Int(viewModel.itemMinSize))")
        Slider(value: $viewModel.itemMinSize, in: 0...(viewModel.itemMaxSize - 1))
        Text("GridItem max size : \(Int(viewModel.itemMaxSize))")
        Slider(value: $viewModel.itemMaxSize, in: (viewModel.itemMinSize + 1)...500)
      }
    } else {
      VStack {
        Text("GridItem size : \(Int(viewModel.itemSize))")
        Slider(value: $viewModel.itemSize, in: 0...200)
      }
    }
  }
}
