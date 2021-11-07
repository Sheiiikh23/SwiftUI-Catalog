//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension SwiftUI.ColorScheme {

  var description: String {
    switch self {
    case .light:
      return "light"
    case .dark:
      return "dark"
    @unknown default:
      fatalError("unknown color scheme")
    }
  }
}
