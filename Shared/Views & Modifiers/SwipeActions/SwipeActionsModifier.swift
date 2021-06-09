//
//  SwipeActionsModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 09/06/2021.
//

import SwiftUI

/// SwipeActions permet d'ajouter des actions customs au swipe sur une row d'une List
/// Disponible sur i•Pad•OS / watchOS / macOS / Mac Catalyst
///
/// Paramètres du modifier :
///   • edge: HorizontalEdge = .trailing ––> indique la position de la View passé
///   • allowsFullSwipe: Bool = true ––> Bool qui indique si un swipe complet exécute automatiquement la première action
///   • content: () -> T ––> Content
///
/// Modifier qui doit être appelé au sein d'un ForEach
/// Utilisation de `tint` pour le background des boutons
/// En utilisant le modifier swipActions, SwiftUI ne synthétise plus le `onDelete(perform:)`, il faudra créer l'action si besoin

// MARK: - Utilisation : Créer un swipeActions sur les rows d'une List

struct SwipeActionsModifier: View {

  var body: some View {
    NavigationView {
      List {
        ForEach(1..<101) { index in
          Text("Row n°\(index)")
            .swipeActions(edge: .leading, allowsFullSwipe: false) {
              Button { } label: {
                if index.isMultiple(of: 2) {
                  Label("Read", systemImage: "envelope.open")
                } else {
                  Label("Unread", systemImage: "envelope.badge")
                }
              }
              .tint(.blue) // Permet d'afficher le background du bouton en blue

              Button { } label: {
                Label("", systemImage: "gear")
              }
              .tint(.purple) // Permet d'afficher le background du bouton en violet
            }
            .swipeActions(edge: .trailing) {
              // Utilisation non nécessaire du tint, rouge par défaut grâce au role .destructive
              Button(role: .destructive) { } label: {
                Label("Delete", systemImage: "trash")
              }

              Button { } label: {
                Label("Flag", systemImage: "flag")
              }
              .tint(.orange) // Permet d'afficher le background du bouton en orange
            }

        }
        .onDelete { index in
          print("onDelete getting called") // Jamais appelé
        }
        .onMove { indexSet, int in
          print("onMove getting called")
        }
      }
      .navigationTitle("Swipe Actions")
      .toolbar { EditButton() }
    }
  }
}
