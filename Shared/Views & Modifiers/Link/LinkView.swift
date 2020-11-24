//
//  LinkView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Link: redirige vers un site en respectant le nav par défaut du user / appli (si deeplink)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Très utile pour les widgets sur des objets où même dans des applis en tant que tell

// MARK: - Utilisation : Permet de rediriger vers le Web / Appli (deeplink)

struct LinkView: View {

  var body: some View {
    VStack(spacing: 30) {

      // Link avec une String en tant que Title
      Link("Site d'Apple", destination: URL(string: "https://developer.apple.com/tutorials/swiftui/")!)
        .font(.title3)
        .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
        .padding()
        .background(Color.orange.opacity(0.5))
        .cornerRadius(20)
      
      /// Link avec une View en tant que label
      /// Plus personnalisable
      Link(destination: URL(string: "https://apple.news/AjriX1CWUT-OfjXu_R4QsnA")!) {
        Label("Apple news", systemImage: "applelogo")
          .foregroundColor(.red)
          .padding()
          .background(Color.pink.opacity(0.25))
          .cornerRadius(20)
      }
    }
  }
}

struct LinkView_Previews: PreviewProvider {
  static var previews: some View {
    LinkView()
  }
}
