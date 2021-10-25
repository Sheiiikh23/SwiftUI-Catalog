//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

enum AlignmentCustom: String, Identifiable, CaseIterable {
  case top
  case leading
  case bottom
  case trailing
  case center
  case topLeading
  case topTrailing
  case bottomLeading
  case bottomTrailing

  var id: String { rawValue }

  var description: String {
    switch self {
    case .top:
      return "top"
    case .leading:
      return "leading"
    case .bottom:
      return "bottom"
    case .trailing:
      return "trailing"
    case .center:
      return "center"
    case .topLeading:
      return "topLeading"
    case .topTrailing:
      return "topTrailing"
    case .bottomLeading:
      return "bottomLeading"
    case .bottomTrailing:
      return "bottomTrailing"
    }
  }
  
  var value: Alignment {
    switch self {
    case .top:
      return .top
    case .leading:
      return .leading
    case .bottom:
      return .bottom
    case .trailing:
      return .trailing
    case .center:
      return .center
    case .topLeading:
      return .topLeading
    case .topTrailing:
      return .topTrailing
    case .bottomLeading:
      return .bottomLeading
    case .bottomTrailing:
      return .bottomTrailing
    }
  }
}
