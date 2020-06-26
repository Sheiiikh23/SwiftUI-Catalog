//
//  LabelView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// Apparition des Labels : Text + Image / Icon
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Cataclyst
///   Text: String
///   Image/ systemImage • icon : String • Shape (+ modifiers)

#warning("Pour le moment les systemImage sont affichés en topLeading par rapport au Text apparement ça devrait être fix prochainement (ou non)")


struct LabelView: View {
  var body: some View {
    NavigationView {

      VStack(spacing: 50) {

        /// Créer un label dont le text et l'image • systemImage vont scales de la même manière
        /// cf le tuto d'Apple sur les SFSymbols (version 2.0 dispo en téléchargement)
        Label("Constructeur n°1 ", systemImage: "magnifyingglass")
          .font(.title)

        /// Créer un label qui permet de spécifier à chaque élément des modifiers qui lui sont propres
        Label {
          Text("Construteur n°2")
            /// Modifiers propres au Text
            .fontWeight(.bold)
            .foregroundColor(.red)
        } icon: {
          Image(systemName: "magnifyingglass")
            /// Modifiers propres à l'Image • systemImage
            .foregroundColor(.blue)
        }

        /// Créer un label qui permer de spécifier à chaque élément des modifiers qui lui sont propres
        /// On peut également appliqué des modifiers pour le Label (càd Text + Image / systemImage • Shape)
        Label {
          Text("Constructeur n°3")
            /// Modifiers propres au Text
            .fontWeight(.bold)
            .foregroundColor(.green)
        } icon: {
          /// Modifiers propres à l'Image • systemImage
          Image(systemName: "magnifyingglass")
            .foregroundColor(.blue)
        }
        /// Modifiers appliqués à tout le label
        .font(.title3)

        /// Créer un label avec une Shape pour l'icon. A noter que chaque élément aura des mofiers qui lui seront propres
        Label {
          Text("Constructeur n°4")
            /// Modifiers propres au Text
            .font(.callout)
            .fontWeight(.thin)
            .foregroundColor(.purple)
        } icon: {
          Circle()
            /// Modifiers propres à la Shape
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
            // La view ne montre que l'image / systemImage • Shape
            // Le Text du label est servie pour l'accessibilité pour les personnes malvoyantes
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
