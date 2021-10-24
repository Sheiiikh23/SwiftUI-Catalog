//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension Visibility {

  var description: String {
    switch self {
    case .automatic:
      return "automatic"
    case .visible:
      return "visible"
    case .hidden:
      return "hidden"
    }
  }
}
