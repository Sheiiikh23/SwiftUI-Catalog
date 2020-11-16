//
//  ToolBarItemGroup.swift
//  iOS
//
//  Created by Lucas Abijmil on 29/08/2020.
//

import SwiftUI

/// ToolBarItemGroup est un groupement de ToolBarItem présens au sein d'une toolBar
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// ToolbarItem : cf ToolBarItemView
/// toolbar modifier : cf ToolBarModifier
/// toolBarItemPlacement : cf ToolBarItemPlacement

// MARK: - Permet de placer plusieurs View au même placement dans la toolbar (et donc d'éviter les HSTack)
struct ToolBarItemGroupView: View {

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

struct TToolBarItemGroupView_Preview: PreviewProvider {
  static var previews: some View {
    Group {
      ToolBarItemGroupView()
    }
  }
}
