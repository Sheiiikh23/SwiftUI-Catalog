//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Indique le type d'alignement à appliquer aux `Text` qui sont sur plusieurs lignes
///
/// Définition de l'`EnvironmentValue` :
///   - var multilineTextAlignment: TextAlignment { get set }
///     - TextAlignment :
///       - center : au centre
///       - leading : dans le sens lecture (par défaut)
///       - trailing : à l'inverse du sens de lecture
///
/// Remarques :
///   - N'a aucun effet pour les textes constitués d'une ligne (`TextField` notamment)
///   - Pour garder de la consistence dans notre layout, on applique généralement le modifier `.multilineTextAlignment(_:)` à des `Views` containers
///   - Pour comprendre un peu plus en détail : https://developer.apple.com/documentation/swiftui/textalignment

struct MultilineTextAlignment: View {

  @Environment(\.multilineTextAlignment) private var multilineTextAlignment

  var body: some View {
    VStack(spacing: 20) {
      Text("Multiline text alignment : \(multilineTextAlignment.description.firstLetterCapitalized)")
        .font(.title2)
        .fontWeight(.bold)
      Text(String.createRandom(length: 500))
    }
  }
}

struct MultilineTextAlignment_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ForEach(SwiftUI.TextAlignment.allCases, id: \.description) { textAlignment in
        MultilineTextAlignment()
          .environment(\.multilineTextAlignment, textAlignment)
          .previewDisplayName(textAlignment.description.firstLetterCapitalized)
      }
    }
  }
}
