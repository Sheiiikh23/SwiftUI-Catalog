//
//  KeyboardShortcut.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// Apparition du modifier keyboardShortcut qui permet de fournir des raccourcis clavier
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Principalement utilisé pour le SceneGroup
/// Permet d'activer un Button ou un Toggle ou d'utiliser des Button présents dans des CommandMenu 's
/// Il existe des Keyboardshortcut natifs :
///   • defaultAction: bouton "return" ––> i•Pad•OS / (watchOS) / tvOS / macOS / Mac Catalyst
///   • cancelAction: bouton esc. ––> i•Pad•OS / (watchOS) / tvOS / macOS / Mac Catalyst
///   • upArrow : U+F700 ??
///   • downArrow : U+F701 ??
///   • leftArrow : U+F702 ??
///   • rightArrow : U+F703 ??
///   • escape : U+001B ??
///   • delete : U+0008 ??
///   • deleteForward : U+F728 ??
///   • home : U+F729 ??
///   • end : U+F72B ??
///   • pageUp : U+F72C ??
///   • pageDown: U+F72D ??
///   • clear : U+F739 ??
///   • tab : U+0009 ??
///   • space: U+0020 ??
///   • return : U+00D ??
///   • character: raccourci clavier custom d'un character UNIQUE

#warning("Normalement dispo pour watchOS. Regarder les updates de la doc")
#warning("Lever les incertitudes. Atteindre les udpates de la doc")

struct KeyboardShortcut: View {

  @State private var toggleValue = false

  var body: some View {
    VStack(spacing: 40) {
      Button("Cancel", action: {})
        .keyboardShortcut(.cancelAction)
      Button("Save", action: {})
        .keyboardShortcut(.defaultAction)
      Toggle("Toggle me", isOn: $toggleValue)
        // Raccourci clavier custom :  cmd + shift (car maj) + t
        .keyboardShortcut("T")
      Button("New shortcut", action: {})
        // Raccourci clavier custom : cmd + t
        .keyboardShortcut("t")
    }
  }
}

struct KeyboardShortcut_Previews: PreviewProvider {
  static var previews: some View {
    KeyboardShortcut()
  }
}
