//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet d'avoir accès au manager des actions (undo, redo)
///
/// Définition de l'`EnvironmentValue` :
///   - var undoManager: UndoManager? { get }
///     - nil : si l'environnement ne supporte pas les opérations d'undo et de redo
///     - UndoManager: voir la doc : https://developer.apple.com/documentation/foundation/undomanager

struct UndoManager: View {

  @Environment(\.undoManager) private var undoManager
  @State private var isActive = true
  private var canUndo: Bool {
    return undoManager != nil
  }

  var body: some View {
    VStack(spacing: 15) {
      Text("Undo manager is supported ? \(canUndo.description)")
      Toggle("", isOn: $isActive)
      HStack(spacing: 15) {
        Button { undoManager?.undo() } label: { Text("Undo") }
        Button { undoManager?.redo() } label: { Text("Redo") }
      }
    }
  }
}

struct UndoManager_Previews: PreviewProvider {
  static var previews: some View {
    UndoManager()
  }
}
