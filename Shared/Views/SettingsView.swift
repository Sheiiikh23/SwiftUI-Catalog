//
//  SettingsView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// Settings : correspond aux préférences (cmd + ,) sur Mac
/// Disponible sur : macOS / Mac Catalyst
/// 
/// Cette View contient principalement des Button / Slider / ColorPicker etc...

// MARK: - Utilisation : Permet à l'utilisateur de régler ses préférences (UI ...)

struct SettingsView: App {
  @SceneBuilder var body: some Scene {
    WindowGroup {
      LabelView()
    }
    #if os(macOS)
    Settings {
      Text("Add your setting UI here")
        .padding()
    }
    #endif
  }
}
