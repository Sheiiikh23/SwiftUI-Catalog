//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

struct LazyGridCellDemo: View {

  @Binding var alignment: Alignment
  let item: Int

  var body: some View {
    ZStack(alignment: alignment) {
        Rectangle()
        .fill(randomColor())
      Text("Item\n n°\(item)")
        .fontWeight(.bold)
        .foregroundColor(.white)
        .padding(.horizontal)
        .background(Color.black.opacity(0.75), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
  }
}
