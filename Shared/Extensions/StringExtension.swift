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

  static func createRandom(length: Int = 32) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).compactMap { _ in letters.randomElement() })
  }
}
