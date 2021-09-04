//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de savoir si la préférence système pour différencier sans couleur est activée (daltoniens)
/// 
/// Définition de l'`EnvironmentValue` :
///   - var accessibilityDifferentiateWithoutColor: Bool { get }
///       - false : par défaut
///       - true : si l'utilisateur l'a activé
///
/// Remarque :
///   - Si true, alors il faut remplacer les couleurs par des shapes / images avec des echelles de gris
///
/// Dans le simulateur : Environment Overrides –> Accessibility ––> Differentiate Without Color

struct AccessibilityDifferentiateWithoutColor: View {

  @Environment(\.accessibilityDifferentiateWithoutColor) private var accessibilityDifferentiateWithoutColor

  var body: some View {
    HStack {
      if accessibilityDifferentiateWithoutColor {
        Image(systemName: "checkmark.circle")
      }
      Text("Success")
        .foregroundColor(.primary)
    }
    .padding()
    .background(accessibilityDifferentiateWithoutColor ? Color.gray : Color.green)
    .clipShape(Capsule())
  }
}

struct AccessibilityDifferentiateWithoutColor_Previews: PreviewProvider {
  static var previews: some View {
    AccessibilityDifferentiateWithoutColor()
  }
}
