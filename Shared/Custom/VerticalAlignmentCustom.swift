//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import Foundation

enum VerticalAlignmentCustom: Identifiable, CaseIterable {
  case top
  case center
  case bottom

  var id: UUID { return UUID() }

  var description: String {
    switch self {
    case .top:
      return "top"
    case .center:
      return "center"
    case .bottom:
      return "bottom"
    }
  }
}

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
