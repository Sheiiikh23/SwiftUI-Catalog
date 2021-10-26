//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension Optional where Wrapped == Text.Case {

  var description: String {
    switch self {
    case .none:
      return "nil"
    case .some(let wrapped):
      return wrapped.description
    }
  }
}

extension Text.Case {

  var description: String {
    switch self {
    case .lowercase:
      return "lowercase"
    case .uppercase:
      return "uppercase"
    @unknown default:
      fatalError("Unknown text case")
    }
  }
}
