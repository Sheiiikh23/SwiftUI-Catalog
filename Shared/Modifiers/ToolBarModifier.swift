//
//  ToolBarModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// ToolBar modifier pour mettre en avant du contenu dans un context de NavigationView
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Permet de créer une toolBar qui change d'apparence et d'endroit en fonction de la plateforme
/// Cette Toolbar est composée de ToolbarItem (cf ToolBarItemView)
///

// MARK: - Utilisation : Permet de mettre en avant des éléments dans un contexte de NavigationView

struct ToolBarModifier: View {
  var body: some View {
    NavigationView {
      List {
        ForEach(1...100, id: \.self) { item in
          Text("Hello Toolbar")
        }
        HStack {
          Spacer()
          Text("There is  10 \"Hello ToolBar\" ")
          Spacer()
        }
      }
      .navigationTitle("Test toolBar")
      .toolbar {
        ToolbarItem(placement: .automatic) {
          Text("Automatic AKA bottom leading")
        }
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Action", action: { })
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          EditButton()
        }
        ToolbarItem(placement: .bottomBar) {
          HStack {
            Spacer()
            Button { } label: {
              Image(systemName: "square.and.arrow.up")
                .font(.title2)
            }
          }
        }
      }
    }
  }
}

struct ToolBarModifier_Previews: PreviewProvider {
  static var previews: some View {
    ToolBarModifier()
  }
}
