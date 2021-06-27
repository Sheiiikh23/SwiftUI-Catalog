//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import Foundation

enum GridItemType: Identifiable, CaseIterable, Comparable {
  case adaptive
  case fixed
  case flexible

  var id: UUID { return UUID() }

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
