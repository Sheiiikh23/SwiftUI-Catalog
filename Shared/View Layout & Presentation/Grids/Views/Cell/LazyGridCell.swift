//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

struct LazyGridsCell: View {

  let item: Int

  var body: some View {
    ZStack {
      Rectangle()
        .fill(randomColor())
      Text("Item\n n°\(item)")
        .fontWeight(.bold)
        .foregroundColor(.white)
        .padding(.horizontal)
    }
  }
}
