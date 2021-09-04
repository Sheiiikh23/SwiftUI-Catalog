//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de savoir si VoiceOver est activé ou non (malvoyants)
///
/// Définition de l'`EnvironmentValue` :
///   - var accessibilityEnabled: Bool { get set }
///       - false : par défaut
///       - true : si l'utilisateur l'a activé
///
/// Remarque :
///   - Si true, alors il faut utiliser des modifiers qui permettent de faciliter l'accès à l'accessibilité commme `help(_:)` ou `accessibilityLabel(_:)`

struct AccessibilityEnabled: View {

  @Environment(\.accessibilityEnabled) private var isAccesibilityActivated

  var body: some View {
    ZStack {
      Color.purple.opacity(0.25).edgesIgnoringSafeArea(.all)
      if isAccesibilityActivated {
        VStack {
          Text("Spoken selection is activated !")
            .font(.title3)
            .fontWeight(.bold)
            .accessibilityLabel("Accesibility is activated !")
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.green)
        .clipShape(Capsule())
      } else {
        VStack {
          Text("Accesibility isn't activated !")
            .font(.title3)
            .fontWeight(.bold)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.red)
        .clipShape(Capsule())
      }
    }
  }
}

struct AccessibilityEnabled_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AccessibilityEnabled()
      AccessibilityEnabled()
        .environment(\.accessibilityEnabled, true)
    }
  }
}
