//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Le type de rédaction a appliqué à la View hierarchy
///
/// Définition de l'`EnvironmentValue` :
///   - var redactionReasons: RedactionReasons { get set }
///     - RedactionReasons :
///       - placeholder : les données affichées apparaissent comme des espaces génériques de placeholder
///       - privacy (i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0) : les données affichées doivent être masquée afin de protéger les informations privées de l'utilisateur
///
/// Remarques :
///   - Le style `privacy` est setté lorsqu'on commence à dismiss l'app ou bien dans le multi-tâches
///   - Le style `privacy` ne donne aucun style à la View hierarchy, il faut à la place display quelque chose d'autre
///   - Si on utilise le modifier `privacySensitive()` alors la redaction sera de type `privacy` automatiquement

struct RedactionReasons: View {

  @Environment(\.redactionReasons) private var redactionReasons
  @State private var currentRedactionReason: SwiftUI.RedactionReasons = .privacy

  var body: some View {
    VStack(spacing: 15) {
      if redactionReasons == .privacy {
        Text("PRIVATE BECAUSE YOU'RE LEAVING THE APP OR ON LOCKED SCREEN")
          .font(.title3)
          .fontWeight(.bold)
          .foregroundColor(.red)
          .multilineTextAlignment(.center)
          .padding()
      }
      Text("Current Redaction Reasons : \(redactionReasons.description)")
      Menu("Choix du type de rédaction") {
        Button { currentRedactionReason = .placeholder } label: { Text("Placeholder") }
        Button { currentRedactionReason = .privacy } label: { Text("Privacy") }
      }
    }
    .environment(\.redactionReasons, currentRedactionReason)
  }
}

struct RedactionReasons_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      RedactionReasons()
      RedactionReasons()
        .environment(\.redactionReasons, .placeholder)
      RedactionReasons()
        .environment(\.redactionReasons, .privacy)
    }
  }
}
