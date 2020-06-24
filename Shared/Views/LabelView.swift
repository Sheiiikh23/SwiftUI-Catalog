//
//  LabelView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// Apparition des Labels : Text + Image / Icon
/// Disponible sur : iOS / watchOS / tvOS / macOS / Mac Cataclyst
/// Pas disponible sur iPadOS
/// Text : String
/// Image = String ou systemImage: String



struct LabelView: View {
  var body: some View {
    NavigationView {

      VStack(spacing: 50) {
        Label("Hello World", systemImage: "magnifyingglass")
          /// Le texte comme l'image scale de la "même manière"
          /// cf le tuto d'Apple sur les SFSymbols
          .font(.title)
        // Manière "moins compact / optimisée" pour mettre une Image • systemImage
        Label {
          Text("Hello World")
        } icon: {
          Image(systemName: "magnifyingglass")
        }
        .font(.subheadline)
        // Mais qui laisse le champs des possibilités un peu plus grand
        Label {
          Text("Hello World")
        } icon: {
          Circle()
            .fill(Color.red)
            .frame(width: 10, height: 10)
        }
      }
      .navigationBarTitle("Hello Labels")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {}) {
            #warning("TODO")
            // MARK: Logiquement dans des childs ne navigationView (à confirmer) :
            // La view ne montre que la•l' system•Image
            // Le Text du label est servie pour l'accessibilité pour les personnes malvoyantes (à confirmer)
            Label("Progress", systemImage: "pencil")
          }
        }
      }
    }
  }
}

//struct Label__Previews: PreviewProvider {
//  static var previews: some View {
//    LabelView()
//  }
//}
