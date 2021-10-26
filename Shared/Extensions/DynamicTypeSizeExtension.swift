//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension SwiftUI.DynamicTypeSize {

  var description: String {
    switch self {
    case .xSmall:
      return "An extra small size"
    case .small:
      return "A small size"
    case .medium:
      return "A medium size"
    case .large:
      return "A large size"
    case .xLarge:
      return "An extra large size"
    case .xxLarge:
      return "An extra extra large size"
    case .xxxLarge:
      return "An extra extra extra large size"
    case .accessibility1:
      return "The first accessibility size"
    case .accessibility2:
      return "The second accessibility size"
    case .accessibility3:
      return "The third accessibility size"
    case .accessibility4:
      return "The fourth accessibility size"
    case .accessibility5:
      return "The fifth accessibility size"
    @unknown default:
      fatalError("Unknown dynamic type size")
    }
  }

  var name: String {
    switch self {
    case .xSmall:
      return "xSmall"
    case .small:
      return "small"
    case .medium:
      return "medium"
    case .large:
      return "large"
    case .xLarge:
      return "xLarge"
    case .xxLarge:
      return "xxLarge"
    case .xxxLarge:
      return "xxxLarge"
    case .accessibility1:
      return "accessibility1"
    case .accessibility2:
      return "accessibility2"
    case .accessibility3:
      return "accessibility3"
    case .accessibility4:
      return "accessibility4"
    case .accessibility5:
      return "accessibility5"
    @unknown default:
      fatalError("Unknown dynamic type size")
    }
  }
}
