//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension SwiftUI.LayoutDirection {

  var description: String {
    switch self {
    case .rightToLeft:
      return "right to left"
    case .leftToRight:
      return "left to right"
    @unknown default:
      fatalError("Unkwon layout direction")
    }
  }
}
