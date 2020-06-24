//
//  Label.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

struct Label_: View {
  var body: some View {
    NavigationView {
      VStack(spacing: 50) {
        // Label = title + image / systemImage
        Label("Hello World", systemImage: "magnifyingglass")
          .font(.title)
        Label {
          Text("Hello World")
        } icon: {
          Image(systemName: "magnifyingglass")
        }
        .font(.subheadline)
      }
      .navigationBarTitle("Hello Label")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {}) {
            // Logiquement dans des childs ne navigationView
            // La view ne montre que la•l' system•Image
            // Le Text du label est servie pour l'accessibilité pour les personnes malvoyantes (à confirmer)
            Label("Progress", systemImage: "pencil")
          }
        }
      }
    }
  }
}

struct Label__Previews: PreviewProvider {
  static var previews: some View {
    Label_()
  }
}
