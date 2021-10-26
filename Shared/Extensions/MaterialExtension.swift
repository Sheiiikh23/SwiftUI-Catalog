//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension Material: Hashable {

  public func hash(into hasher: inout Hasher) { }

  public static func == (lhs: Material, rhs: Material) -> Bool {
    return lhs.hashValue == rhs.hashValue
  }

  var description: String {
    switch self {
    case .ultraThinMaterial, .ultraThin:
      return "ultraThinMaterial"
    case .thinMaterial, .thin:
      return "thinMaterial"
    case .regularMaterial, .regular:
      return "regularMaterial"
    case .thickMaterial, .thick:
      return "thickMaterial"
    case .ultraThickMaterial, .ultraThick:
      return "ultraThickMaterial"
    default:
      return ""
    }
  }
}
