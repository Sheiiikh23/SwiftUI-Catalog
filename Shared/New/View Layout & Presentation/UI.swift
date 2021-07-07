//
//  UI.swift
//  iOS
//
//  Created by Lucas Abijmil on 12/06/2021.
//

import SwiftUI

enum UI {

  enum Spacing: CGFloat {

    /// 0
    case none = 0

    /// 4
    case extraSmall = 4

    /// 8
    case small = 8

    /// 12
    case medium = 12

    /// 16
    case large = 16

    /// 20
    case extraLarge = 20

    /// 24
    case extraExtraLarge = 24
  }
}

extension VStack {

  init(alignment: HorizontalAlignment = .center, spacing: UI.Spacing, @ViewBuilder content: () -> Content) {
    self.init(alignment: alignment, spacing: spacing.rawValue, content: content)
  }
}
extension HStack {

  init(alignment: VerticalAlignment = .center, spacing: UI.Spacing, @ViewBuilder content: () -> Content) {
    self.init(alignment: alignment, spacing: spacing.rawValue, content: content)
  }
}
