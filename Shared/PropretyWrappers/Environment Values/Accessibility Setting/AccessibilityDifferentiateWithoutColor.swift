//
//  AccessibilityDifferentiateWithoutColor.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 22/07/2020.
//

import SwiftUI

/// accessibilityDifferentiateWithoutColor permet d'améliorer la lecture pour les daltoniens
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// accessibilityDifferentiateWithoutColor: Bool { get }
///   - false: par défaut
///   - true: si l'utisateur l'ativé
///
/// Remplacer les couleurs de text par des shapes / systemImage
/// Échelle de gris: black / gray / white (+ opacity)

// MARK: - Importance pour l'accessibilité : faible - moyenne 
// MARK: - Utilisation : Pour les daltoniens

struct AccessibilityDifferentiateWithoutColor: View {

  @Environment(\.accessibilityDifferentiateWithoutColor) var isDaltonien

  var body: some View {
    HStack {
      // check si l'option d'accessibilité est activée
      if isDaltonien {
        Image(systemName: "checkmark.circle")
      }
      Text("Success")
        .foregroundColor(.primary)
    }
    .padding()
    .background(isDaltonien ? Color.gray : Color.green)
    .clipShape(Capsule())
  }
}

struct AccessibilityDifferentiateWithoutColor_Previews: PreviewProvider {
  static var previews: some View {
    AccessibilityDifferentiateWithoutColor()
    // FIXME: Ne fonctionne pas pour le moment
//      .environment(\.accessibilityDifferentiateWithoutColor, true)
  }
}
