//
//  CommandsModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// Commands permet de rajouter des commandes à des scènes
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// Comportement :
///   - macOS : Présent dans la bar des menu (comportement connu et attendu par tout utilisateur)
///   - iPadOS : Les commandes avec des raccourcis claviers sont présent dans HUD (cmd)
///
/// Création d'un menu : cf CommandMenu & CommandGroup
/// Souvent accompagné de shortcut : cf KeyboardShortcutModifier

// MARK: - Utilisation : Création de menu, de menu déroulant et de raccourcis clavier

struct CommandsModifier: App {
  var body: some Scene {
    WindowGroup {
      LabelView()
    }

    /// Ajout de commandes
    .commands {
      /// Création d'un menu Shape entre View et Windows
      CommandMenu("Shape") {
        /// Bouton n°1
        Button("Add Shape...", action: {})
          /// Raccourci clavier : cmd + shift (car maj) + n
          .keyboardShortcut("N")

        // Bouton n°2
        Button("Add Text", action: {})
          /// Raccourci clavier :  cmd + shift (car maj) + t
          .keyboardShortcut("T")
      }

      /// Création d'un menu Hey entre View et Windows (et donc juste après Shape)
      CommandMenu("Hey") {
        /// Bouton n°1
        Button("Hey", action: {})
      }

      /// Création d'un CommandGroup après les commandes de Window
      CommandGroup(after: .windowArrangement) {
        /// Bouton n°1
        Button("Dark mode", action: {})
          /// Autre raccourci clavier
          .keyboardShortcut("[")

        /// Bouton n°2
        Button("Light mode", action: {})
          /// Autre raccourci clavier
          .keyboardShortcut("]")

        /// Bouton n°3
        Button("System mode", action: {})
          /// Autre raccourci clavier
          .keyboardShortcut("–")
      }
    }
  }
}
