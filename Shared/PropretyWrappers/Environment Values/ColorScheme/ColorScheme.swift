//
//  ColorScheme.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 23/07/2020.
//

import SwiftUI

/// colorScheme permet de détecter si le dark mode est activé
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// colorScheme: ColorScheme { get set } 
///   - black
///   - light: par défaut 
///

// MARK: - Importance pour l'accessibilité : très élevée
// MARK: - Utilisation : Permet de connaître le colorScheme de l'utilisateur
// MARK: - Remarque : Pas besoin si on passe par les couleurs de l'assets, qui nous permettent de sets 2 couleurs en fonctions du colorScheme

struct ColorScheme: View {

  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    if case .dark = colorScheme {
      ZStack {
        Color.purple.edgesIgnoringSafeArea(.all)
        Text("The color scheme is dark")
          .foregroundColor(.white)
          .fontWeight(.bold)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color.black)
          .clipShape(Capsule())
      }
    } else {
      ZStack {
        Color.yellow.edgesIgnoringSafeArea(.all)
        Text("The color scheme is white")
          .foregroundColor(.black)
          .fontWeight(.bold)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color.white)
          .clipShape(Capsule())
      }
    }
  }
}

struct ColorScheme_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ColorScheme()
      ColorScheme()
        .environment(\.colorScheme, .dark)
    }
  }
}
