//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de savoir quel `weight` à appliquer au texte
///
/// Définition de l'`EnvironmentValue` :
///   - var legibilityWeight: LegibilityWeight? { get set }
///       - regular : par défaut
///       - bold : si l'utilisateur l'a activé
///
/// Remarque :
///   - Si bold, le système ce charge automatique d'appliquer cela au Text, donc pas besoin d'utiliser le modifier `fontWeight(_:)`

struct LegibilityWeight: View {
  
  @Environment(\.legibilityWeight) private var legibilityWeight

  var body: some View {

    Text(legibilityWeight == .bold ? "The text is bold by default" : "The text is regular by default")
      .foregroundColor(legibilityWeight == .bold ? .red : .green)
      .padding(.horizontal, 20)
      .padding(.vertical, 10)
      .background(legibilityWeight == .bold ? .green : .red)
      .clipShape(Capsule())
  }
}

struct LegibilityWeight_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LegibilityWeight()
      LegibilityWeight()
        .environment(\.legibilityWeight, .bold)
    }
  }
}
