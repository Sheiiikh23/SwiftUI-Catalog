//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {

  var orEmpty: String {
    switch self {
    case .none:
      return ""
    case .some(let wrapped):
      return wrapped
    }
  }
}
