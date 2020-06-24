//
//  KeyboardShortcut.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

struct KeyboardShortcut: View {
    var body: some View {
      VStack(spacing: 40) {
        Button("Cancel", action: {})
          // Les keyboardShortcut permettent à l'utilisateur d'utiliser des raccourcis claviers
          // Il existe des shortcuts pré-builder par Apple
          .keyboardShortcut(.cancelAction)

        Button("Save", action: {})
          .keyboardShortcut(.defaultAction)
      }
    }
}

struct KeyboardShortcut_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardShortcut()
    }
}
