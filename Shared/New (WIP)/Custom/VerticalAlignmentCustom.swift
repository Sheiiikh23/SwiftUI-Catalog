//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

enum VerticalAlignmentCustom: Identifiable, CaseIterable {
  case top
  case center
  case bottom
  case firstTextBaseline
  case lastTextBaseline

  var id: UUID { return UUID() }

  var description: String {
    switch self {
    case .top:
      return "top"
    case .center:
      return "center"
    case .bottom:
      return "bottom"
    case .firstTextBaseline:
      return "first text baseline"
    case .lastTextBaseline:
      return "last text baseline"
    }
  }
  
  var value: VerticalAlignment {
    switch self {
    case .top:
      return .top
    case .center:
      return .center
    case .bottom:
      return .bottom
    case .firstTextBaseline:
      return .firstTextBaseline
    case .lastTextBaseline:
      return .lastTextBaseline
    }
  }
}
