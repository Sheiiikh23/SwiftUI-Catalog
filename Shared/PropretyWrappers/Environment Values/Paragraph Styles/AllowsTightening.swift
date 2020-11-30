//
//  AllowsTightening.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 25/07/2020.
//

import SwiftUI

/// allowsTightening indique l'espace entre les caractères doit être resserrer pour faire tenir le texte dans l'espace disponible
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// allowsTightening: Bool { get set } 
///   - false : par défaut
///   - true
///
/// Cette compressions de texte se fait dans une “certaine limite"

// MARK: - Importance pour l'accessibilité : très faible - faible
// MARK: - Utilisation : Pas besoin car déjà natif avec le modifier en question

struct AllowsTightening: View {

  @Environment(\.allowsTightening) private var isTightening

  var body: some View {
    VStack {
      Text("This is a wide text element")
        .font(.body)
        .frame(width: 200, height: 50)
        .lineLimit(1)
        .allowsTightening(true)

      Text("This is a wide text element")
        .font(.body)
        .frame(width: 200, height: 50)
        .lineLimit(1)
        .allowsTightening(false)
    }
  }
}

struct AllowsTightening_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AllowsTightening()
      AllowsTightening()
        .environment(\.allowsTightening, true)
    }
  }
}
