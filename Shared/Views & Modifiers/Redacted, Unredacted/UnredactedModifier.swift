//
//  UnredactedModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 03/12/2020.
//

import SwiftUI

/// unredacted permet de supprimer toute rédaction appliqué sur la hiérarchie des vues
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///

// MARK: - Utilisation : Supprimer toute rédaction appliqué sur la hiérarchie des vues

struct UnredactedModifier: View {
  var body: some View {
    VStack(spacing: 75) {
      VStack {
        Text("Suppression de toute rédaction sur ce VStack")
          .font(.title3)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
        BookmarkView()
      }
      .unredacted()

      VStack {
        Text("Sans suppression de toute rédaction sur ce VStack")
          .font(.title3)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
        BookmarkView()
      }
    }
    .redacted(reason: .placeholder)
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

struct UnredactedModifier_Previews: PreviewProvider {
  static var previews: some View {
    UnredactedModifier()
  }
}
