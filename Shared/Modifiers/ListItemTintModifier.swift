//
//  ListItemTintModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// ListItemTint propre au Label lorsqu'ils sont utilisés en tant que ListItem
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Permet d'override l'accent color pour l'Image • systemImage • icon d'un label
/// Couleur spécifique à ce modifier: monochrome

// MARK: - Utilisation : Permet d'override l'accent color pour l'image • systemImage • icon d'un Label

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
        Label("Accent Color not override", systemImage: "flame.fill")
      }
      .navigationBarTitle("Hello listItemTint")
      .listStyle(InsetGroupedListStyle())
      .accentColor(.orange)
    }
  }
}

struct ListItemTintModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ListItemTintModifier()
      ListItemTintModifier()
        .preferredColorScheme(.dark)
    }
  }
}
