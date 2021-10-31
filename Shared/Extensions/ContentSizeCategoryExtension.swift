//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension ContentSizeCategory {

  var description: String {
    switch self {
    case .extraSmall:
      return "An extra small size"
    case .small:
      return "A small size"
    case .medium:
      return "A medium size"
    case .large:
      return "A large size"
    case .extraLarge:
      return "An extra large size"
    case .extraExtraLarge:
      return "An extra extra large size"
    case .extraExtraExtraLarge:
      return "An extra extra extra large size"
    case .accessibilityMedium:
      return "The medium accessibility"
    case .accessibilityLarge:
      return "The large accessibility"
    case .accessibilityExtraLarge:
      return "The extra large accessibility"
    case .accessibilityExtraExtraLarge:
      return "The extra extra large accessibility"
    case .accessibilityExtraExtraExtraLarge:
      return "The extra extra extra large accessibility"
    @unknown default:
      fatalError("Unknown dynamic type size")
    }
  }

  var name: String {
    switch self {
    case .extraSmall:
      return "extraSmall"
    case .small:
      return "small"
    case .medium:
      return "medium"
    case .large:
      return "large"
    case .extraLarge:
      return "extraLarge"
    case .extraExtraLarge:
      return "extraExtraLarge"
    case .extraExtraExtraLarge:
      return "extraExtraExtraLarge"
    case .accessibilityMedium:
      return "accessibilityMedium"
    case .accessibilityLarge:
      return "accessibilityLarge"
    case .accessibilityExtraLarge:
      return "accessibilityExtraLarge"
    case .accessibilityExtraExtraLarge:
      return "accessibilityExtraExtraLarge"
    case .accessibilityExtraExtraExtraLarge:
      return "accessibilityExtraExtraExtraLarge"
    @unknown default:
      fatalError("Unknown dynamic type size")
    }
  }
}
