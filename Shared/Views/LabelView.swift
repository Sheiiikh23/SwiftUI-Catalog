//
//  LabelView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// Apparition des Labels : Text + Image / Icon
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Cataclyst
/// Text: String
/// Image: String ou systemImage: String



struct LabelView: View {
  var body: some View {
    NavigationView {

      VStack(spacing: 50) {

        /// Créer un label dont le text et l'image • systemImage vont scale de la même manière
        /// cf le tuto d'Apple sur les SFSymbols
        Label("Hello World", systemImage: "magnifyingglass")
          .font(.title)

        /// Créer un label qui permet de spécifier à chaque élément des modifiers qui lui sont propre
        Label {
          Text("Hello World")
            /// Modifiers propre au Text
            .fontWeight(.bold)
            .foregroundColor(.red)
        } icon: {
          Image(systemName: "magnifyingglass")
            /// Modifiers propre à l'Image • systemImage
            .foregroundColor(.blue)
        }

        /// Créer un label qui permer de spécifier à chaque élément des modifiers qui lui sont propre
        Label {
          Text("Hello World")
            /// Modifiers propre au Text
            .fontWeight(.bold)
            .foregroundColor(.green)
        } icon: {
          /// Modifiers propre à l'Image • systemImage
          Image(systemName: "magnifyingglass")
            .foregroundColor(.blue)
        }
        /// Permet également d'appliquer des modifiers appliqué pour tout le label
        .font(.title3)

        /// Créer un label qui permet de prendre autre chose qu'une image • systeImage pour l'icon. A noter que les chaque élément aura des mofiers qui lui seront propre
        Label {
          Text("Hello World")
            .font(.callout)
            .fontWeight(.thin)
            .foregroundColor(.purple)
        } icon: {
          Circle()
            .fill(Color.red)
            .frame(width: 40, height: 40)
        }

      }
      .navigationBarTitle("Hello Labels")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {}) {
            #warning("TODO")
            // MARK: Logiquement dans des childs de navigationView (à confirmer) :
            // La view ne montre que la•l' system•Image
            // Le Text du label est servie pour l'accessibilité pour les personnes malvoyantes (à confirmer)
            Label("Progress", systemImage: "pencil")
          }
        }
      }
    }
  }
}


struct LabelView_Previews: PreviewProvider {
  static var previews: some View {
    LabelView()
  }
}
