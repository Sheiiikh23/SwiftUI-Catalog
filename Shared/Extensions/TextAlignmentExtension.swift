//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension SwiftUI.TextAlignment {

  var description: String {
    switch self {
    case .center:
      return "center"
    case .leading:
      return "leading"
    case .trailing:
      return "trailing"
    }
  }
}
