//
//  SwiftUIView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 17/11/2020.
//

import SwiftUI

/// Modifier propre au Menu
/// Disponible sur i•Pad•OS / macOS / Mac Catalyst
///
/// MenuStyle présents nativement :
///   • DefaultMenuStyle : par défaut, en fonction du context
///   • BorderedButtonMenuStyle : macOS uniquement
///   • BorderlessButtonMenuStyle : boutton sans bordure qui bascule l'affichage du menu lorsqu'on appuie dessus (voit pas la différence 🤔)
///

// MARK: - Utilisation : Permet de customiser la UI d'un Menu

struct MenuStyleModifier: View {

  var body: some View {
    VStack(spacing: 200) {
      Menu("Menu principal") {
        Button { } label: { Label("Home", systemImage: "house.fill") }
        Button { } label: { Label("Like", systemImage: "suit.heart.fill") }
        Button { } label: { Label("Options", systemImage: "gear") }
        Button { } label: { Label("Account", systemImage: "person.fill") }
      }
      .menuStyle(DefaultMenuStyle())

      #if os(macOS)
      Menu("Menu principal") {
        Button { } label: { Label("Home", systemImage: "house.fill") }
        Button { } label: { Label("Like", systemImage: "suit.heart.fill") }
        Button { } label: { Label("Options", systemImage: "gear") }
        Button { } label: { Label("Account", systemImage: "person.fill") }

      }
      .menuStyle(BorderedButtonMenuStyle())
      #endif

      Menu("Menu principal") {
        Button { } label: { Label("Home", systemImage: "house.fill") }
        Button { } label: { Label("Like", systemImage: "suit.heart.fill") }
        Button { } label: { Label("Options", systemImage: "gear") }
        Button { } label: { Label("Account", systemImage: "person.fill") }
      }
      .menuStyle(BorderlessButtonMenuStyle())

    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.gray.opacity(0.33))
    .ignoresSafeArea()
  }
}


struct MenuStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    MenuStyleModifier()
  }
}
