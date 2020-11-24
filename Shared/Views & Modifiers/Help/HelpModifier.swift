//
//  HelpModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// Apparition du modifier help afin de facilité l'accesibilité de l'application
/// Disponible sur : i•Pad•OS / watcOS / tvOS / macOS / Mac Catalyst
///
///   • i•Pad•OS / watchOs (?) / tvOS (?) : voiceOver lira la String contenu dans le modifier
///   • macOS / Mac Catalyst: info bulle "classique"

// MARK: - Utilisation : Si on souhaite rendre notre application plus accessible (ici pour les malvoyants)

struct HelpModifier: View {
  var body: some View {
    Button(action: {}) {
      Label("Hello World !", systemImage: "person")
    }
    .help("Text saying Hello World with a person icon")
  }
}

struct HelpModifier_Previews: PreviewProvider {
  static var previews: some View {
    HelpModifier()
  }
}
