//
//  ContextMenuModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// ContextMenu permet de créer des menu contextuel avec force touch (à l'inver de la View Menu)
/// Disponible sur : i•Pad•OS / tvOS / macOS / Mac Catalyst

// MARK: - Utilisation : Créer des menus contextuels avec force touch
struct ContextMenuModifier: View {

  var body: some View {
    VStack {
      Text("Menu principal")
        .foregroundColor(.red)
        .contextMenu {
          Button { } label: { Label("Home", systemImage: "house.fill") }
          Button { } label: { Label("Like", systemImage: "suit.heart.fill") }
          Button { } label: { Label("Options", systemImage: "gear") }
          Button { } label: { Label("Account", systemImage: "person.fill") }
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.black)
    .ignoresSafeArea()
  }
}

struct ContextMenuModifier_Previews: PreviewProvider {
  static var previews: some View {
    ContextMenuModifier()
      .environment(\.colorScheme, .dark)
  }
}

