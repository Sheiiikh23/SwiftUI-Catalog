//
//
//  Copyright (c) 2020 Lucas Abijmil.

import SwiftUI

// MARK: backgroundColor is a handy contraction of the background modifier for a color with / without an opacity.
extension View {

  /// .backgroundColor(with: .red)
  /// .backgroundColor(with: .red, at: 0.5)
  func backgroundColor(with color: Color, at opacity: Double = 1) -> some View {
    self
      .background(color.opacity(opacity))
  }
}
