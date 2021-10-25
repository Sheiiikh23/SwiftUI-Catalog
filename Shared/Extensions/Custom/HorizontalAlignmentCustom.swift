//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

enum HorizontalAlignmentCustom: String, Identifiable, CaseIterable {
  case leading
  case center
  case trailing

  var id: String { rawValue }

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
  
  var value: HorizontalAlignment {
    switch self {
    case .leading:
      return .leading
    case .center:
      return .center
    case .trailing:
      return .trailing
    }
  }
}
