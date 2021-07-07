//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

#warning("TO DO")

struct ControlGroupView: View {

  var body: some View {
    ControlGroup {
      Slider(value: .constant(50), in: 0...100)
      Text("Ok")
    }
  }
}

struct ControlGroupView_Previews: PreviewProvider {
  static var previews: some View {
    ControlGroupView()
  }
}
