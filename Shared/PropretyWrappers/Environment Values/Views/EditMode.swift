//
//  EditMode.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 09/09/2020.
//

import SwiftUI

/// editMode permet de mettre en valeur les vues modifiables par l'utilisateur
/// Disponible sur : i•Pad•OS / tvOS / Mac Catalyst
///
/// editMode: Binding<EditMode>? { get set } 
///   - active : l'utilisateur peut modifier une vue (un champ par ex)
///   - inactive : l'utilisateur ne peut pas modifier cette vue
///   - transient : l'utisateur peut temporérement modifier le champ
///

// MARK: - Importance pour l'accessibilité : moyenne
// MARK: - Utilisation : Utile pour faciliter la compréhension pour l'utilisateur

struct EditMode: View {

  @Environment(\.editMode) var editMode
  @State private var text = ""

    var body: some View {
      VStack {
        TextField("Text", text: $text) { isEditing in
          if isEditing { editMode?.wrappedValue = .active }
        } onCommit: {
          editMode?.wrappedValue = .inactive
        }
        Text("My text : \(text)")
          .foregroundColor(editMode?.wrappedValue == .active ? .red : .green)
      }

    }
}

struct EditMode_Previews: PreviewProvider {
    static var previews: some View {
        EditMode()
    }
}
