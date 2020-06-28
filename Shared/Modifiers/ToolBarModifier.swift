//
//  ToolBarModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// Arrivé du toolBar modifier obligatoirement contenu dans une NavigationView ––> i•Pad•OS / watchOS /
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Permet de créer une toolBar qui changenet d'apparence et d'endroit en fonction de la plateforme
/// Cette Toolbar est essentiellement (pour pas dire exclusivement) composée de ToolbarItem (cf ToolBarItemPlaceModifier)


#warning("Normalement dispo pour watchOS. Regarder les updates de la doc")

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
      .navigationBarTitle("Test toolBar")

      /// Création de la toolBar
      .toolbar {

        /// Ajout d'un ToolbarItem
        ToolbarItem(placement: .automatic) {
          Text("Automatic AKA bottom leading")
        }

        /// Ajout d'un ToolbarItem
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Action", action: { })
        }

        /// Ajout d'un ToolbarItem
        ToolbarItem(placement: .navigationBarTrailing) {
          EditButton()
        }

        /// Ajout d'un ToolbarItem
        ToolbarItem(placement: .bottomBar) {
          HStack {
            Spacer()
            Button(action: {}, label: {
              Image(systemName: "square.and.arrow.up")
                .font(.title2)
            })
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
