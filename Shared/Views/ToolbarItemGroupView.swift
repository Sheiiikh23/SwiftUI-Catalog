//
//  ToolbarItemGroup.swift
//  iOS
//
//  Created by Lucas Abijmil on 29/08/2020.
//

import SwiftUI

/// ToolbarItemGroup est un groupement de ToolbarItem présens au sein d'une toolbar
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// ToolbarItem : cf ToolbarItemView
/// ToolbarItemPlacement : cf ToolbarItemPlacement
/// toolbar modifier : cf ToolbarModifier

// MARK: - Permet de placer plusieurs View au même placement dans la toolbar (et donc d'éviter les HSTack)
struct ToolbarItemGroupView: View {

  var body: some View {
    NavigationView {
      Text("Hello World")
        .navigationTitle("SwiftUI")
        .toolbar {
          ToolbarItemGroup(placement: .navigationBarLeading) {
            Text("Leading 1")
            Button { } label: { Text("Leading 2") }
            Text("Leading 3")
          }
          ToolbarItem(placement: .bottomBar) {
            Text("Yo")
            // Pas affiché
            Text("Plop")
          }
          ToolbarItemGroup(placement: .navigationBarTrailing) {
            Text("Automatic 1")
            EditButton()
          }
        }
    }
  }
}

struct ToolbarItemGroupView_Preview: PreviewProvider {
  static var previews: some View {
    Group {
      ToolbarItemGroupView()
    }
  }
}
