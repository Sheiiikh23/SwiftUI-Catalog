//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Booléen qui indique si l'espacement entre les caractères peut être resserré pour faire tenir le texte dans l'espace disponible
///
/// Définition de l'`EnvironmentValue` :
///   - var allowsTightening: Bool { get set }
///     - false : par défaut
///     - true
///
/// Remarque :
///   - Pour permettre à une vue de resserer ces caractères on utilise le modifier `allowsTightening(_:)`

struct AllowsTightening: View {

  @Environment(\.allowsTightening) private var allowsTightening
  @State private var isAllowingTightening = false

  var body: some View {
    VStack {
      Toggle("Allow tightening ?", isOn: $isAllowingTightening)
      Text("This is a wide text element")
        .font(.body)
        .frame(width: 200, height: 50)
        .lineLimit(1)
    }
    .environment(\.allowsTightening, isAllowingTightening)
  }
}

struct AllowsTightening_Previews: PreviewProvider {
  static var previews: some View {
    AllowsTightening()
  }
}
