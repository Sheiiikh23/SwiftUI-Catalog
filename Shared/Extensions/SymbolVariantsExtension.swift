//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension SwiftUI.SymbolVariants {

  static var allCases: [Self] {
    return [.none,
            .slash,
            .circle,
            .slash.circle,
            .rectangle,
            .square,
            .slash.square,
            .fill,
            .slash.fill,
            .circle.fill,
            .slash.circle.fill,
            .rectangle.fill,
            .square.fill,
            .slash.square.fill]
  }

  var descrition: String {
    switch self {
    case .none:
      return "None"
    case .slash:
      return "Slash"
    case .circle:
      return "Circle"
    case .slash.circle:
      return "Slash Circle"
    case .rectangle:
      return "Rectangle"
    case .slash.rectangle:
      return "Slash Rectangle"
    case .square:
      return "Square"
    case .slash.square:
      return "Slash Square"
    case .fill:
      return "Fill"
    case .slash.fill:
      return "Slash Fill"
    case .circle.fill:
      return "Circle Fill"
    case .slash.circle.fill:
      return "Slash Circle Fill"
    case .rectangle.fill:
      return "Rectangle Fill"
    case .slash.rectangle.fill:
      return "Slash Rectangle Fill"
    case .square.fill:
      return "Square Fill"
    case .slash.square.fill:
      return "Slash Square Fill"
    default:
      fatalError("Unkwon symbol variant")
    }
  }
}
