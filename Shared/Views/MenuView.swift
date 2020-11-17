//
//  MenuView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 07/08/2020.
//

import SwiftUI

/// Menu permet de créer des menu contextuel sans force touch
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// On peut aussi imbriquer des menus entre eux (exemple 3) avec une animation out of the box

// MARK: - Utilisation : Créer des menu contextuel sans force touch pour notamment afficher des actions

struct MenuView: View {

  var body: some View {
    VStack(spacing: 200) {

      /// Menu avec une String en tant que Title
      Menu("Menu principal") {
        Button { } label: { Label("Home", systemImage: "house.fill") }
        Button { } label: { Label("Like", systemImage: "suit.heart.fill") }
        Button { } label: { Label("Options", systemImage: "gear") }
        Button { } label: { Label("Account", systemImage: "person.fill") }

      }

      /// Menu avec une View en tant que Label
      /// Plus personnalisable
      Menu {
        Button { } label: { Label("Home", systemImage: "house.fill") }
        Button { } label: { Label("Like", systemImage: "suit.heart.fill") }
        Button { } label: { Label("Options", systemImage: "gear") }
        Button { } label: { Label("Account", systemImage: "person.fill") }
      } label: {
        Text("Menu principal")
          .font(.subheadline)
          .fontWeight(.bold)
          .textCase(.uppercase)
          .foregroundColor(.red)
          .padding(.horizontal, 20)
          .padding(.vertical)
          .background(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
          .cornerRadius(20)
      }

      /// Menu imbriquée
      /// 1er Menu avec une View en tant que Label (plus personnalisable)
      Menu {
        Button { } label: { Text("Duplicate") }
        Button { } label: { Text("Rename") }
        Button { } label: { Text("Delete") }
        /// 2nd Menu avec une String en tant que Title
        Menu("Copy...") {
          Button { } label: { Text("Copy") }
          Button { } label: { Text("Copy formatted") }
          Button { } label: { Text("Copy library path") }
        }
      } label: {
        Text("Actions principales")
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.black)
    .ignoresSafeArea()
  }
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    MenuView()
      .environment(\.colorScheme, .dark)
  }
}




