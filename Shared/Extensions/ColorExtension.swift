//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension Color {

  var description: String {
    switch self {
    case .black:
      return "black"
    case .white:
      return "white"
    case .blue:
      return "blue"
    case .indigo:
      return "indigo"
    case .cyan:
      return "cyan"
    case .gray:
      return "gray"
    case .mint:
      return "mint"
    case .teal:
      return "teal"
    case .purple:
      return "purple"
    case .pink:
      return "pink"
    case .orange:
      return "orange"
    case .red:
      return "red"
    case .yellow:
      return "yellow"
    case .green:
      return "green"
    default:
      fatalError("unknown color")
    }
  }
}
