//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de connaître l'orientation de lecture : gauche à droite ou droite à gauche
///
/// Définition de l'`EnvironmentValue` :
///   - var layoutDirection: LayoutDirection { get set }
///     - LayoutDirection :
///       - leftToRight : lecture de gauche à droite
///       - rightToLeft : lecture de droite à gauche

struct LayoutDirection: View {

  @Environment(\.layoutDirection) private var layoutDirection

  var body: some View {
    if case .leftToRight = layoutDirection {
      Text("Left to Right")
    } else if case .rightToLeft = layoutDirection {
      Text("Right to Left")
    }
  }
}

struct LayoutDirection_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ForEach(SwiftUI.LayoutDirection.allCases, id: \.description) { layoutDirection in
        LayoutDirection()
          .environment(\.layoutDirection, layoutDirection)
          .previewDisplayName(layoutDirection.description.firstLetterCapitalized)
      }
    }
  }
}
