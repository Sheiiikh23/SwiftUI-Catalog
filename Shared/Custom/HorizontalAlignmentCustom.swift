//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import Foundation

enum HorizontalAlignmentCustom: Identifiable, CaseIterable {
  case leading
  case center
  case trailing

  var id: UUID { return UUID() }

  var description: String {
    switch self {
    case .leading:
      return "leading"
    case .center:
      return "center"
    case .trailing:
      return "trailing"
    }
  }
}
