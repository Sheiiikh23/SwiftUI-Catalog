//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Permet de définir l'orientation de la preview
///
/// 1 seule signature :
///   - func previewInterfaceOrientation(_ value: InterfaceOrientation) -> some View
///
/// Paramètre :
///   - InterfaceOrientation :
///       - portrait
///       - portraitUpsideDown
///       - landscapeLeft
///       - landscapeRight

struct PreviewInterfaceOrientationModifier_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      ForEach(InterfaceOrientation.allCases) { orientation in
        SafeAreaInsetModifier()
          .previewInterfaceOrientation(orientation)
      }
    }
  }
}
