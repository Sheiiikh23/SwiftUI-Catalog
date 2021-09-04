//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Permet de savoir si la préférence système pour afficher les formes des boutons est activée
///
/// Définition de l'`EnvironmentValue` :
///   - var accessibilityShowButtonShapes: Bool { get }
///       - false : par défaut
///       - true : si l'utilisateur l'a activé
///
/// Remarque :
///   - Si true, alors les contrôles inteactifs doivent être affichés de manière à ce que leurs bords soient clairement visibles

struct AccessibilityShowButtonShapes: View {

  @Environment(\.accessibilityShowButtonShapes) private var accessibilityShowButtonShapes

  var body: some View {
    if accessibilityShowButtonShapes {
      Button { } label: {
        Text("Button Shape is activated")
          .font(.title2)
          .fontWeight(.bold)
          .foregroundColor(.black)
      }
    } else {
      Button { } label: {
        Text("Button shape is desactivated")
          .font(.title2)
          .fontWeight(.bold)
          .foregroundColor(.black)
      }
    }
  }
}

struct AccessibilityShowButtonShapes_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AccessibilityShowButtonShapes()
    }
  }
}
