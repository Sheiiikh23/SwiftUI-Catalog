//
//  AccessibilityReduceMotion.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 22/07/2020.
//

import SwiftUI

/// accessibilityReduceMotion permet de réduire les animations
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// accessibilityReduceMotion: Bool { get } 
///   - false: par défaut
///   - true: si l'utisateur l'ativé
///
/// Proposition d'une alternative pour inclure les deux cas
/// Modifier pour la preview ne fonctionne pas

// MARK: - Importance pour l'accessibilité : très faible - faible 
// MARK: - Utilisation : Réduction des animations

struct AccessibilityReduceMotion: View {

  @Environment(\.accessibilityReduceMotion) var isReduceMotion
  @State private var scaleEffect: CGFloat = 1

  var body: some View {
    VStack {
      Text("Scale effect with / without animation")
        .font(.body)
        .fontWeight(.bold)
        .scaleEffect(scaleEffect)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.blue)
        .clipShape(Capsule())
        .onTapGesture {
          // check si l'option d'accessibilité est activée
          if isReduceMotion {
            scaleEffect *= 1.5
          } else {
            withAnimation(.easeIn) {
              scaleEffect *= 1.5
            }
          }
        }
    }
  }
}


// Alternative pour ne pas animer et animer en fonction de l'accésibilité
struct AccessibilityWithOptionnalAnimation: View {

  @State private var scaleEffect: CGFloat = 1

  var body: some View {
    VStack {
      Text("Scale effect with / without withOptionnalAnimation function")
        .font(.body)
        .fontWeight(.bold)
        .scaleEffect(scaleEffect)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.blue)
        .clipShape(Capsule())
        .onTapGesture {
          // check implicit si l'option d'accessibilité est activée
          withOptionnalAnimation(.easeIn) {
            scaleEffect *= 1.5
          }
        }
    }
  }
  private func withOptionnalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled { return try body() }
    else { return try withAnimation(animation, body) }
  }
}


struct AccessibilityReduceMotion_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AccessibilityReduceMotion()
      AccessibilityReduceMotion()
      // FIXME: Ne fonctionne pas pour le moment
//        .environment(\.accessibilityReduceMotion, true)
      AccessibilityWithOptionnalAnimation()
    }
  }
}
