//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Le raccourci clavier avec lequel les actions de boutons de l'environment seront déclanchés
///
/// Définition de l'`EnvironmentValue` :
///   - var keyboardShortcut: KeyboardShortcut? { get }
///     - nil si aucun raccourci appliqué dans la View
///     - `KeyboardShortcut` :
///       - cancelAction : Esc. Raccourci clavier standard pour annuler l'action en cours
///       - defaultAction : ↩. Raccourci clavier standard pour le bouton par défaut
///
/// Remarques :
///   - Très utilisé dans les `ButtonStyle`
///   - S'accompagne des modifiers `keyboardShortcut(_:, modifiers: :)` & `keyboardShortcut(_:)`

struct KeyboardShortcut: View {
  var body: some View {
    VStack(spacing: 20) {
      Button("Tap me or press ⌘D") {
        print("tapped or pressed d")
      }
      .keyboardShortcut("D", modifiers: [.command])

      Button("Tap me or press ⌘Z") {
        print("tapped or pressed z")
      }
      .keyboardShortcut("Z", modifiers: [.command])

      Button("Tap me or press ↩") {
        print("tapped or pressed ↩")
      }
      .keyboardShortcut(.defaultAction)
    }
    .buttonStyle(KeyboardButtonStyle())
  }
}

fileprivate struct KeyboardButtonStyle: ButtonStyle {

  @Environment(\.keyboardShortcut) private var shortcut

  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.body.weight(shortcut == .init("D") ? .heavy : .regular))
      .foregroundColor(shortcut == .init("Z") ? .red : shortcut == .defaultAction ? .purple : .primary)
  }
}

struct KeyboardShortcut_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardShortcut()
    }
}
