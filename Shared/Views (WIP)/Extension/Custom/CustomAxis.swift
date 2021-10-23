//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

enum CustomAxis: String, CaseIterable, Identifiable {
  case vertical = "vertical"
  case horizontal = "horizontal"
  case verticalAndHorizontal = "vertical & horizontal"

  var value: Axis.Set {
    switch self {
    case .vertical:
      return .vertical
    case .horizontal:
      return .horizontal
    case .verticalAndHorizontal:
      return [.vertical, .horizontal]
    }
  }

  var id: UUID { UUID() }
}
