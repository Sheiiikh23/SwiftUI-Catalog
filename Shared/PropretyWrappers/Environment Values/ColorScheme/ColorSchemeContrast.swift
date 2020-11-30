//
//  ColorSchemeContrast.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/07/2020.
//

import SwiftUI

/// colorSchemeContrast permet de détecter si les constrastes sont augmentés
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// colorSchemeContrast: ColorSchemeContrast { get }
///   - standard: par défaut
///   - increased: si l'utisateur l'ativé
///
/// Si activé, alors le système utilise un contrast accru entre les couleurs d'avant et arrière plan
/// À utiliser pour agrémenter l'utilisation de @Environment(\.colorScheme)

// MARK: - Importance pour l'accessibilité : faible - moyenne
// MARK: - Utilisation : Permet de savoir si les contrastes sont augmentés

struct ColorSchemeContrast: View {

  @Environment(\.colorSchemeContrast) private var isConstrastIncreased

  var body: some View {
    if case .increased = isConstrastIncreased {
      ZStack {
        Color.purple.edgesIgnoringSafeArea(.all)
        Text("Color contrast is increased")
          .foregroundColor(.white)
          .fontWeight(.bold)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color.green)
          .clipShape(Capsule())
      }
    } else {
      ZStack {
        Color.yellow.edgesIgnoringSafeArea(.all)
        Text("Color constrast is default")
          .foregroundColor(.black)
          .fontWeight(.bold)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color.blue)
          .clipShape(Capsule())
      }
    }
  }
}

struct ColorSchemeContrast_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ColorSchemeContrast()
      ColorSchemeContrast()
      // FIXME: Ne fonctionne pas
//        .environment(\.colorSchemeContrast, .increased)
    }
  }
}
