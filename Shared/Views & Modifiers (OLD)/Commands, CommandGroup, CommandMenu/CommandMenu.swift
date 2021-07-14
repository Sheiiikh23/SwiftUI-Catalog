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
/// Dans ces menu nous pouvons utilisé les View suivante :
///   • Button
///   • Picker
///   • Toggle
///   • Divider

// MARK: - Utilisation : Création de menu (déroulant) pour des commandes

struct CommandMenuView: App {

  @State private var pickerSelection = 0
  @State private var toggleValue = true

  var body: some Scene {
    WindowGroup {
      LabelView()
    }
    .commands {
      CommandMenu("SwiftUI") {
        Button { } label: { Text("Some command") }
        Button { } label: { Text("Some command") }

        /// Création d'un picker qui va avoir ± la forme d'un nested menu
        Picker(selection: $pickerSelection, label: Text("Filter")) {
          Text("Command 1")
            .tag(0)
          Text("Command 2")
            .tag(1)
          Text("Command 3")
            .tag(2)
        }
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
        Toggle("Oh yes you are !", isOn: $toggleValue)
      }
    }
  }
}
