//
//  KeyboardShortcut.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// KeyboardShortcut qui permet de fournir des raccourcis clavier
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// Principalement utilisé pour le SceneGroup, bouttons, commandGroup etc....
/// Il existe des Keyboardshortcut natifs :
///   • clear
///   • delete
///   • deleteForward
///   • downArrow
///   • end
///   • escape
///   • home
///   • leftArrow
///   • pageDown
///   • pageUp
///   • return
///   • rightArrow
///   • space
///   • tab
///   • upArrow
/// Shortcut avec un caractère : "T" par exemple (case sensitive, donc pour les maj rajout implicit d'un shift)
///
/// Par défaut les shortcuts s'exécutent en appuyant sur la cmd mais possibilité de modifier
/// Liste des possibilité du modifiers :
///   • all
///   • capsLock
///   • command (défaut et même par convention implicite d'Apple)
///   • control
///   • function
///   • numericPad
///   • option
///   • shift
///


// MARK: - Utilisation : Créer des raccourcis clavier sur iPadOS / MacOS / Mac Catalyst

struct KeyboardShortcut: View {

  @State private var toggleValue = false

  var body: some View {
    VStack(spacing: 40) {

      /// cmd (défaut) + delete
      Button("Cancel", action: {})
        .keyboardShortcut(.delete)

      /// cmd (défaut) + return ↩
      Button("Save", action: {})
        .keyboardShortcut(.defaultAction)

      /// cmd + shift (car maj) + t
      Toggle("Toggle me", isOn: $toggleValue)
        .keyboardShortcut("T")

      /// cmd + t
      Button("New shortcut", action: {})
        .keyboardShortcut("t")

      /// contol + <-
      Button("New shortcut", action: {})
        .keyboardShortcut(.leftArrow, modifiers: .control)

      /// control + shift (car maj) + m
      Button("New shortcut", action: {})
        .keyboardShortcut("M", modifiers: .control)
    }
  }
}

struct KeyboardShortcut_Previews: PreviewProvider {
  static var previews: some View {
    KeyboardShortcut()
  }
}
