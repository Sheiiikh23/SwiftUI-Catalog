//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension SwiftUI.RedactionReasons {

  var description: String {
    switch self {
    case .placeholder:
      return "placeholder"
    case .privacy:
      return "privacy"
    default:
      return ""
    }
  }
}
