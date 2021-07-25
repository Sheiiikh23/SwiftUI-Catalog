//
//  AccessibilityReduceTransparency.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 23/07/2020.
//

import SwiftUI

/// accessibilityReduceTransparency permet de détecter si la transparence et les blurs sont désactivés
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// accessibilityReduceTransparency: Bool { get } 
///   - false: par défaut
///   - true: si l'utisateur l'ativé
///
/// Si activé alors les backgrounds doivent êtres opaques

// MARK: - Importance pour l'accessibilité : très faible - faible 
// MARK: - Utilisation : Savoir si la transparence et les blurs sont désactivés, probablement pour les malvoyants ?

struct AccessibilityReduceTransparency: View {

  @Environment(\.accessibilityReduceTransparency) private var isReduceTransparency

  var body: some View {
    ZStack {
      Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)).opacity(isReduceTransparency ? 1 : 0.75).edgesIgnoringSafeArea(.all)
      VStack {
        Text("You may activated the reduce transparency")
          .font(.title3)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
          .foregroundColor(.black)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          // check ternaire pour savoir si l'option d'accessibilité est activée
          .background(isReduceTransparency ? Color.white : Color.red.opacity(0.75))
          .clipShape(Capsule())
      }
    }
  }
}


struct AccessibilityReduceTransparency_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AccessibilityReduceTransparency()
      AccessibilityReduceTransparency()
        // FIXME: Ne fonctionne pas 
//        .environment(\.accessibilityReduceTransparency, true)
    }
  }
}
