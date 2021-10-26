//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension Text.TruncationMode {

  static var allCases: [Self] {
    return [.head, .middle, .tail]
  }

  var description: String {
    switch self {
    case .head:
      return "head"
    case .middle:
      return "middle"
    case .tail:
      return "tail"
    @unknown default:
      fatalError("Unknown truncation mode")
    }
  }
}
