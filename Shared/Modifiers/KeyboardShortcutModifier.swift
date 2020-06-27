//
//  KeyboardShortcut.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// Apparition du modifier keyboardShortcut qui permet de fournir des raccourcis clavier
/// Disponible sur : i•Pad•OS / tvOS / macOS / Mac Catalyst
///
/// Principalement utilisé pour le SceneGroup
/// Permet d'activer un Button ou un Toggle
///

#warning("Normalement dispo pour watchOS. Regarder les updates de la doc")

struct KeyboardShortcut: View {

@State private var toggleValue = false

    var body: some View {
      VStack(spacing: 40) {
        Button("Cancel", action: {})
          .keyboardShortcut(.cancelAction)
        Button("Save", action: {})
          .keyboardShortcut(.defaultAction)
        Toggle("Toggle me", isOn: $toggleValue)
      }
    }
}

struct KeyboardShortcut_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardShortcut()
    }
}
