//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension Material: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.finalize()
  }

  public static func == (lhs: Material, rhs: Material) -> Bool {
    return lhs.hashValue == rhs.hashValue
  }
}
