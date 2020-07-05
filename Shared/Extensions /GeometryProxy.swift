//
//
//  Copyright (c) 2020 Lucas Abijmil.

import SwiftUI

// MARK: GeometryProxy extension for renaming properties
extension GeometryProxy {
  
  /// geo.width = geo.size.width
  var width: CGFloat {
    size.width
  }
  
  /// geo.height = geo.size.height
  var height: CGFloat {
    size.height
  }
  
  /// geo.safeTop = geo.safeAreaInsets.top
  var safeTop: CGFloat {
    safeAreaInsets.top
  }
  
  /// geo.safeBottom = geo.safeAreaInsets.bottom
  var safeBottom: CGFloat {
    safeAreaInsets.bottom
  }
}
