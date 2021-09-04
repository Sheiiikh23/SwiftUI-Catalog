//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension Alignment {

  var description: String {
    switch self {
    case .top:
      return "top"
    case .leading:
      return "leading"
    case .bottom:
      return "bottom"
    case .trailing:
      return "trailing"
    case .center:
      return "center"
    case .topLeading:
      return "topLeading"
    case .topTrailing:
      return "topTrailing"
    case .bottomLeading:
      return "bottomLeading"
    case .bottomTrailing:
      return "bottomTrailing"
    default:
      return ""
    }
  }
}
