//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, macOS 10.15, Mac Catalyst 15.0
/// Description : Permet de connaître la taille à appliquer aux contrôles dans la `View`
///
/// Définition de l'`EnvironmentValue`:
///   – var controlSize: ControlSize { get set }
///       - mini
///       - small
///       - regular : par défaut
///       - large
///
/// Remarque :
///   - On peut set la size d'un contrôle grâce au modifier `controlSize(_:)`

struct ControlSize: View {

  @Environment(\.controlSize) var controlSize

  var body: some View {
    Button { } label: {
      Text("Current controlSize: \(controlSize.description.firstLetterCapitalized)")
        .fontWeight(.bold)
        .foregroundColor(.red)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(.indigo, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
    .controlSize(controlSize)
  }
}

struct ControlSize_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ControlSize()
        .environment(\.controlSize, .mini)
      ControlSize()
        .environment(\.controlSize, .small)
      ControlSize()
      ControlSize()
        .environment(\.controlSize, .large)
    }
  }
}
