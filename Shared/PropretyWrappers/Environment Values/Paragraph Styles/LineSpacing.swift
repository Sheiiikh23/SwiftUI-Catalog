//
//  LineSpacing.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/07/2020.
//

import SwiftUI

/// lineSpacing indique l'espace entre deux lignes de texte (Text, TextEditor...)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// lineSpacing: CGFloat { get set } 
///   - 0 ou 1 : par défaut (pas de restriction)
///   - Int : indique le d'espace en point

// MARK: - Importance pour l'accessibilité : très faible - faible
// MARK: - Utilisation : Pas besoin car déjà natif avec le modifier en question

struct LineSpacing: View {

  @Environment(\.lineSpacing) private var lineSpacing

  var body: some View {
    VStack {
      Text("Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte.")
        .font(.caption)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .lineSpacing(1)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.blue)

      Text("Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte.")
        .font(.caption)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.blue)
    }
  }
}

struct LineSpacing_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LineSpacing()
      LineSpacing()
        .environment(\.lineSpacing, 40)
    }
  }
}
