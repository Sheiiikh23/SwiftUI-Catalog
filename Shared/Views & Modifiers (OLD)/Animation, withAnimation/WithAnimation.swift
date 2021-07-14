//
//  WithAnimation.swift
//  iOS
//
//  Created by Lucas Abijmil on 12/06/2021.
//

import SwiftUI

/// `withAnimation` permet d'ajouter une animation dite explicite à une `View`
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Une seule signature :
///   - func withAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result
/// Cette fonction renvoie le résultat du recalcul du `body` avec l'animation fournie

// MARK: - Utilisation : Ajouter une animation à une View selon une action

struct WithAnimation: View {

  @State private var scaledUp = true

  var body: some View {
    Text("First")
      .scaleEffect(scaledUp ? 2 : 1)
      .onTapGesture {
        withAnimation(.linear(duration: 1)) { scaledUp.toggle() }
      }
  }
}

struct WithAnimation_Previews: PreviewProvider {
  static var previews: some View {
    WithAnimation()
  }
}
