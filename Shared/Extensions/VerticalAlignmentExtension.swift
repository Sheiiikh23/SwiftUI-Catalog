//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension VerticalAlignment {

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
    default:
      return ""
    }
  }
}
