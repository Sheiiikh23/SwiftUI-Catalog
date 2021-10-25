//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension SwiftUI.SymbolRenderingMode: RawRepresentable, Equatable {

  public typealias RawValue = Int

  public init?(rawValue: Int) {
    switch rawValue {
    case 0:
      self = .hierarchical
    case 1:
      self = .monochrome
    case 2:
      self = .multicolor
    case 3:
      self = .palette
    default:
      self = .hierarchical
    }
  }

  public var rawValue: Int {
    switch self {
    case .hierarchical:
      return 0
    case .monochrome:
      return 1
    case .multicolor:
      return 2
    case .palette:
      return 3
    default:
      return 0
    }
  }
}
