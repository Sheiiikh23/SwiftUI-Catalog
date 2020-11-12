//
//  Locale.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 10/09/2020.
//

import SwiftUI

/// locale indique la langue de préférence
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// locale: Locale { get set }
///

// MARK: - Importance pour l'accessibilité : faible - très faible
// MARK: - Utilisation : Peut être rarement utile (utilisation des LocalizedStrings)

struct Locale: View {

  @Environment(\.locale) var locale

  var body: some View {
    Text(locale.description)
//      .ifModifier(for: locale.identifier == "en_EN", with: BlueLabel())
//      .ifModifier(for: locale.identifier == "en_FR", with: RedLabel())
  }
}

struct Locale_Previews: PreviewProvider {
  static var previews: some View {
    Locale()
  }
}


struct RedLabel: ViewModifier {

  func body(content: Content) -> some View {
    content
      .foregroundColor(.red)
  }
}

struct BlueLabel: ViewModifier {

  func body(content: Content) -> some View {
    content
      .foregroundColor(.blue)
  }
}
