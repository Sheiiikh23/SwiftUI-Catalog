//
//  LineLimit.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/07/2020.
//

import SwiftUI

/// lineLimit indique le nombre maximum de ligne d'une View (Text, TextEditor ...)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// lineLimit: Int? { get set } 
///   - nil : par défaut (pas de restriction)
///   - Int : indique le nombre de ligne maximum du texte
/// Possibilité de set cet environment variable avec le modifier .environment(\.lineLimit, Int?)

// MARK: - Importance pour l'accessibilité : très faible - faible
// MARK: - Utilisation : Pas besoin car déjà natif avec le modifier en question

struct LineLimit: View {


  @Environment(\.lineLimit) private var lineLimit

  var body: some View {
    VStack {
      Text("Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.Beaucoup de texte.")
        .font(.caption)
        .fontWeight(.bold)
        .lineLimit(2)
        .foregroundColor(.black)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.blue.opacity(0.5))
        .clipShape(Capsule())
        .padding()
    }
  }
}

struct LineLimit_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LineLimit()
      LineLimit()
        .environment(\.lineLimit, 4)
    }
  }
}
