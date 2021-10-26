//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension SwiftUI.Font {

  static var allCases: [Self] {
    return [.largeTitle,
            .title,
            .title2,
            .title3,
            .headline,
            .subheadline,
            .body,
            .callout,
            .caption,
            .caption2,
            .footnote]
  }


  var description: String {
    switch self {
    case .largeTitle:
      return "largeTitle"
    case .title:
      return "title"
    case .title2:
      return "title2"
    case .title3:
      return "title3"
    case .headline:
      return "headline"
    case .subheadline:
      return "subheadline"
    case .body:
      return "body"
    case .callout:
      return "callout"
    case .caption:
      return "caption"
    case .caption2:
      return "caption2"
    case .footnote:
      return "footnote"
    default:
      fatalError("Unknown")
    }
  }
}
