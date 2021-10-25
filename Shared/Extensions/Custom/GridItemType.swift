//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import Foundation

enum GridItemType: String, Identifiable, CaseIterable{
  case adaptive
  case fixed
  case flexible

  var id: String { rawValue }

  var description: String {
    switch self {
    case .adaptive:
      return "adaptive"
    case .fixed:
      return "fixed"
    case .flexible:
      return "flexible"
    }
  }
}
