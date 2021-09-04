//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import Foundation

extension String {

  var firstLetterCapitalized: String {
    return self.capitalizingFirstLetter()
  }

  static let empty = ""

  func capitalizingFirstLetter() -> String {
    return prefix(1).capitalized + dropFirst()
  }

  mutating func capitalizeFirstLetter() {
    self = self.capitalizingFirstLetter()
  }
}
