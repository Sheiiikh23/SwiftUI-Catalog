//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension View {

  func randomColor() -> Color {
    let colors: [Color] = [.red, .gray, .green, .yellow, .orange, .purple, .blue, .brown, .mint, .pink, .indigo]
    return colors.randomElement() ?? colors[1]
  }
}
