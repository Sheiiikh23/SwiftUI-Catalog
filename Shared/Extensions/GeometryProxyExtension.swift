//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

extension GeometryProxy {

  var height: CGFloat {
    return size.height
  }

  var width: CGFloat {
    return size.width
  }

  var safeTop: CGFloat {
    return safeAreaInsets.top
  }

  var safeBottom: CGFloat {
    return safeAreaInsets.bottom
  }
}
