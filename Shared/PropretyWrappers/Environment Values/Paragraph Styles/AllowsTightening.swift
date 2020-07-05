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

// MARK: - Importance pour l'accessibilité : très faible - faible
// MARK: - Utilisation : Indique si les caractères doivent être resseré ou non 

struct AllowsTightening: View {

  @Environment(\.allowsTightening) var isTightening

  var body: some View {
    VStack {
      if isTightening {
        Text("Inter spacement character have to be reduced")
          .font(.title2)
          .fontWeight(.bold)
          .foregroundColor(.black)
          .allowsTightening(true)
          .padding(.vertical, 10)
          .padding(.horizontal, 20)
          .background(Color.purple.opacity(0.25))
          .clipShape(Capsule())
      } else {
        Text("Text fit well")
          .font(.title2)
          .fontWeight(.bold)
          .foregroundColor(.white)
          .padding(.vertical, 10)
          .padding(.horizontal, 20)
          .background(Color.red.opacity(0.5))
          .clipShape(Capsule())
      }
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
