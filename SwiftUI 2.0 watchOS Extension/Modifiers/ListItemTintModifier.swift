//
//  ListItemTintModifier.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Nouveau modifier propre au listItem: listItemTint
/// Comportement différent par rapport à i•Pad•OS, etc...
///
/// Fonctionne sur tous les style de List sur watchOS
/// Et fonctionne également sur toute type de View

struct ListItemTintModifier: View {
  var body: some View {
    NavigationView {
      List {
        Label("Hello row n°1", systemImage: "person.fill")
          .listItemTint(.monochrome)
        Label("Yo par ici la diff", systemImage: "magnifyingglass")
          .listItemTint(.purple)
        Label("Acharné, affamé sont mes qualitifcatifs", systemImage: "music.note")
          .listItemTint(.green)
        Label("Hello row n°2", systemImage: "person.fill")
          .listItemTint(.red)
        Label("Dehors tout le monde pert la raison", systemImage: "magnifyingglass")
          .listItemTint(.purple)
        Label("Sourire quand tout va mal", systemImage: "music.note")
          .listItemTint(.green)
        Label("Hello row n°3", systemImage: "person.fill")
          .listItemTint(.red)
        Label("Solo quand tout va mal", systemImage: "magnifyingglass")
          .listItemTint(.purple)
        Label("Claque la porte comme à mes 16 ans", systemImage: "music.note")
          .listItemTint(.green)
        Group {
          Label("Flamme", systemImage: "flame.fill")
            .listItemTint(.pink)
          Image(systemName: "flame.fill")
            .listItemTint(.pink)
          Text("Hello there")
            .listItemTint(.purple)
        }
      }
      .navigationBarTitle("Hello listItemTint")
    }
  }
}

struct ListItemTintModifier_Previews: PreviewProvider {
  static var previews: some View {
    ListItemTintModifier()
  }
}
