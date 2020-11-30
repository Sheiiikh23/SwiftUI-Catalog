//
//  AccessibilityShowButtonShapes.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 23/07/2020.
//

import SwiftUI

/// accessibilityShowButtonShapes permet de détecter si les boutons doivent être plus facilement identifiable
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// accessibilityShowButtonShapes: Bool { get } 
///   - false: par défaut
///   - true: si l'utisateur l'ativé
///
/// Si activé, alors les contrôles intéractifs doivent être clairement identifiables
/// Par défaut & si activé, les boutons sont soulignés

// MARK: - Importance pour l'accessibilité : faible - moyenne
// MARK: - Utilisation : Faciliter la reconnaissance des boutons pour les malvoyants (?)

struct AccessibilityShowButtonShapes: View {

  @Environment(\.accessibilityShowButtonShapes) private var isButtonShape

  var body: some View {
    if isButtonShape {
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
      AccessibilityShowButtonShapes()
      // FIXME: Ne fonctionne pas
//        .environment(\.accessibilityShowButtonShapes, true)
    }
  }
}
