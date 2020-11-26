//
//  Font.swift
//  iOS
//
//  Created by Lucas Abijmil on 26/11/2020.
//

import SwiftUI

/// Font indique la font par défaut utilisé par l'utilisateur
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// textCase: Font? { get set }
///  - largeTitle
///  - title
///  - title2
///  - title3
///  - headline
///  - subheadline
///  - body : par défaut
///  - callout
///  - caption
///  - caption2
///  - footnote
///

// MARK: - Importance pour l'accessibilité : faible - très faible
// MARK: - Utilisation : Pas besoin car déjà natif avec le modifier en question

struct FontView: View {

  @Environment(\.font) var fontSize

  var body: some View {
    VStack {
      Text("Text using a the font modifier (title3)")
        .font(.title3)
      Text("Text using the font environment")
    }
  }
}

struct Font_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      FontView()
        .environment(\.font, .subheadline)
      FontView()
        .environment(\.font, .largeTitle)
    }
  }
}
