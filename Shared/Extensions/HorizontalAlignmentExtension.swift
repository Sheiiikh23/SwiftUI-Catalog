//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension HorizontalAlignment {

  var description: String {
    switch self {
    case .leading:
      return "leading"
    case .center:
      return "center"
    case .trailing:
      return "trailing"
    default:
      return ""
    }
  }

  mutating func map(_ customAlignment: HorizontalAlignmentCustom) {
    switch customAlignment {
    case .leading:
      self = .leading
    case .center:
      self = .center
    case .trailing:
      self = .trailing
    }
  }
}
