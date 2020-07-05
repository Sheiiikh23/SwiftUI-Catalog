//
//  AccessibilityInvertColors.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 22/07/2020.
//

import SwiftUI

/// accessibilityInvertColors permet de détecter si les couleurs sont inversées
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// accessibilityInvertColors: Bool { get } 
///   - false: par défaut
///   - true: si l'utisateur l'ativé
///
/// Les couleurs "classiques" ne sont donc pas de leur couleur 
/// Modifier pour la preview ne fonctionne pas

// MARK: - Importance pour l'accessibilité : très faible - faible 
// MARK: - Utilisation : Probablement pour les daltoniens 

struct AccessibilityInvertColors: View {

  @Environment(\.accessibilityInvertColors) var isColorInvert

  var body: some View {
    ZStack {
      Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)).edgesIgnoringSafeArea(.all)
      // check si l'option d'accessibilité est activée
      if isColorInvert {
        VStack {
          Text("Invert colors is activated")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.black)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.red)
        .clipShape(Capsule())
      } else {
        VStack {
          Text("Invert colors isn't activated")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.black)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.red)
        .clipShape(Capsule())
      }
    }
  }
}

struct AccessibilityInvertColors_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AccessibilityInvertColors()
      AccessibilityInvertColors()
        .colorInvert()
        // FIXME: Ne fonctionne pas pour le moment 
//        .environment(\.accessibilityInvertColors, true)
    }
  }
}
