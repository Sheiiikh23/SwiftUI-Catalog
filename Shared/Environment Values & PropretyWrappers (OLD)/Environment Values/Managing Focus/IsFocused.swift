//
//  IsFocused.swift
//  iOS
//
//  Created by Lucas Abijmil on 01/12/2020.
//

import SwiftUI

/// isFocused permet d'indiquer si l'ancêtre le plus proche à le focus
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// isFocused: Bool { get }
///   • false : si pas pas d'ancêtre focusable
///   • true : si l'ancêtre le plus proche à le focus
/// Je vois pas trop l'intêret sur iOS, à tester particulièrement sur watchOS & tvOS (crown focus & remote focus)

// MARK: - Importance pour l'accessibilité : très faible – faible
// MARK: - Utilisation : Intéressant pour savoir où se trouve le focus actuel

struct IsFocused: View {

  @Environment(\.isFocused) private var isFocused
  @State private var textValue = ""
  @State private var text = ""

  var body: some View {
    VStack {
      TextField("Enter some Text", text: $textValue)
        .foregroundColor(isFocused ? .green : .red)
      VStack {
        TextField("Enter some Text", text: $text)
          .foregroundColor(isFocused ? .green : .red)
        Text(isFocused ? "I'm focused" : "I'm not focused")
      }
    }
  }
}

struct IsFocused_Previews: PreviewProvider {
  static var previews: some View {
    IsFocused()
  }
}
