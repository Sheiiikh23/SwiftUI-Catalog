//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension SwiftUI.ControlSize {

  var description: String {
    switch self {
    case .mini:
      return "mini"
    case .small:
      return "small"
    case .regular:
      return "regular"
    case .large:
      return "large"
    @unknown default:
      fatalError("unknown ControlSize")
    }
  }
}
