//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension Prominence {

  var description: String {
    switch self {
    case .standard:
      return "standard"
    case .increased:
      return "increased"
    @unknown default:
      return "uknown Prominence"
    }
  }
}
