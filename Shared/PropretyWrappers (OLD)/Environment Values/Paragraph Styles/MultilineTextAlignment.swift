//
//  MultilineTextAlignment.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 04/08/2020.
//

import SwiftUI

/// multilineTextAlignment indique l'alignement du texte lors d'un retour à la ligne
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// multilineTextAlignment: TextAlignment { get set } 
///   - center : par défaut
///   - leading
///   - trailing
/// Possibilité de set cet environment variable avec le modifier .environment(\.multilineTextAlignment, .option)

// MARK: - Importance pour l'accessibilité : très faible - faible
// MARK: - Utilisation : Pas besoin car déjà natif avec le modifier en question 

struct MultilineTextAlignment: View {

  @Environment(\.multilineTextAlignment) private var textAlignment

  var body: some View {
    ZStack {
      Color.purple.opacity(0.75)
      VStack(spacing: 50) {
        Text("Voici l'histoire du multilineTextAlignment. Voici l'histoire du multilineTextAlignment. Voici l'histoire du multilineTextAlignment. Voici l'histoire du multilineTextAlignment.")
          .font(.caption)
          .fontWeight(.bold)
          .foregroundColor(.white)
          .multilineTextAlignment(.leading)
          .frame(width: 225)

        Text("Voici l'histoire du multilineTextAlignment. Voici l'histoire du multilineTextAlignment. Voici l'histoire du multilineTextAlignment. Voici l'histoire du multilineTextAlignment.")
          .font(.caption)
          .fontWeight(.bold)
          .foregroundColor(.white)
          .frame(width: 225)
      }
    }
  }
}

struct MultilineTextAlignment_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      MultilineTextAlignment()
        .environment(\.multilineTextAlignment, .leading)
      MultilineTextAlignment()
        .environment(\.multilineTextAlignment, .center)
      MultilineTextAlignment()
        .environment(\.multilineTextAlignment, .trailing)
    }
  }
}
