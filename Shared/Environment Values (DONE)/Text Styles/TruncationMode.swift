//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Le type de troncature à appliquer à la dernière ligne d'un `Text` lorsqu'elle est trop longue pour tenir dans l'espace disponible
///
/// Définition de l'`EnvironmentValue` :
///   - var truncationMode: Text.TruncationMode { get set }
///     - Text.TruncationMode :
///       - head : Tronque au début de la ligne
///       - middl : Tronque au milieu de la ligne
///       - tail : Tronque à la fin de la ligne, par défaut
///
/// Remarques :
///   - Certains controls, peuvent avoir une valeur par défaut différente en fonction du contexte
///   - Le texte tronqué est remplacé par "..." lorsqu'il ne peut pas afficher tout le texte
///   - Pour tronquer un `Text` en particulier, on utilise le modifier `truncationMode(_:)`

struct TruncationMode: View {

  @Environment(\.truncationMode) private var truncationMode

  var body: some View {
    VStack(spacing: 20) {
      Text("Truncation mode : \(truncationMode.description.firstLetterCapitalized)")
        .font(.title)
        .fontWeight(.bold)
      Text(String.createRandom(length: 500))
        .lineLimit(1)
    }
    .padding(.horizontal)
  }
}

struct TruncationMode_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      TruncationMode()
      ForEach(Text.TruncationMode.allCases, id: \.description) { truncationMode in
        TruncationMode()
          .environment(\.truncationMode, truncationMode)
          .previewDisplayName(truncationMode.description.firstLetterCapitalized)
      }
    }
  }
}
