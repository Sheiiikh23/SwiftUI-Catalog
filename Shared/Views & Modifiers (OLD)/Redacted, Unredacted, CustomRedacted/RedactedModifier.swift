//
//  RedactedModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 03/12/2020.
//

import SwiftUI

#warning("NEEED AN UPDATE")

/// redacted permet d'appliquer une rédaction particulière en fonction d'un contexte
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// RedactionReasons : type de rédaction
///   • placeholder :
///     - texte et image apparaissent comme des caractères génériques masqués, conservant leur taille et forme d'origine
///     - à utiliser pour ne pas exposé directement les datas
///     - très utile pour le refresh des Widgets, par exemple
///
/// Les rédactions sont additives: childRedactionReasons + parentRedactionReasons

// MARK: - Utilisation : Appliquer une rédaction particulière en fonction d'un contexte donné, généralement pour masquer des données

struct RedactedModifier: View {
  var body: some View {
    VStack(spacing: 75) {
      VStack {
        Text("Sans rédaction")
          .font(.title)
          .fontWeight(.bold)
        BookmarkView()
      }
      VStack {
        Text("Avec rédaction")
          .font(.title)
          .fontWeight(.bold)
        BookmarkView()
          .redacted(reason: .placeholder)
      }
    }
  }
}

fileprivate struct BookmarkView: View {
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 8) {
        Text("Bookmarker un episode")
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(.blue)
        Text("Beaucoup de texte mais genre vraiment")
          .font(.subheadline)
          .fontWeight(.semibold)
      }
      Spacer()
      Image(systemName: "bookmark.fill")
        .renderingMode(.original)
        .font(.system(size: 36, weight: .bold))
    }
    .padding(.horizontal)
  }
}

struct Redacted_Previews: PreviewProvider {
  static var previews: some View {
    RedactedModifier()
  }
}
