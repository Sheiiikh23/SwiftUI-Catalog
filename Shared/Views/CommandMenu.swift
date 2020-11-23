//
//  CommandMenu & CommandGroup.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 23/11/2020.
//

import SwiftUI

/// CommandMenu permet de créer des menus déroulant custom (entre View et Window, en fonction de l'ordre de déclaration)
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// CommandMenu se trouve obligatoirement dans un commands modifier : cf CommandsModifier
/// Possibilité de faire des "nested menu" (menu contenu dans un autre menu)

// MARK: - Utilisation : Création de menu (déroulant) pour des commandes

struct CommandMenuView: App {

  var body: some Scene {
    WindowGroup {
      LabelView()
    }
    .commands {
      CommandMenu("SwiftUI") {
        Button { } label: { Text("Some command") }
        Button { } label: { Text("Some command") }
        Button { } label: { Text("Some command") }
        Button { } label: { Text("Some command") }
      }
      CommandMenu("UIKit") {
        Button { } label: { Text("No command for UIKit 🤣") }
        Button { } label: { Text("No command for UIKit 🤣") }
        Button { } label: { Text("No command for UIKit 🤣") }
        Button { } label: { Text("No command for UIKit 🤣") }
      }
      CommandMenu("CocoaPod") {
        Button { } label: { Text("You seems to be old") }
        Divider()
        Button { } label: { Text("Oh yes you are !")
        }
      }
    }
  }
}
