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
/// On passe par la wrappedValue pour modifier la valeur de l'environmentValue
///   - active : l'utilisateur peut modifier une vue (un champ par ex)
///   - inactive : l'utilisateur ne peut pas modifier cette vue
///   - transient : l'utisateur peut temporairement modifier le champ
/// Pas mal pour utiliser avec des textFields pour changer la couleur etc...

// MARK: - Importance pour l'accessibilité : moyenne
// MARK: - Utilisation : Utile pour faciliter la compréhension pour l'utilisateur

struct EditMode: View {

  @Environment(\.editMode) private var editMode
  @State private var text = ""

  var body: some View {
    VStack {
      TextField("Text", text: $text) { isEditing in
        isEditing ? (editMode?.wrappedValue = .active) : (editMode?.wrappedValue = .inactive)
      } onCommit: {
        editMode?.wrappedValue = .inactive
      }
      Text(editMode?.wrappedValue == .active ? "You're editing" : "You're not editing" + " this text : \(text)")
        .foregroundColor(editMode?.wrappedValue == .active ? .red : .green)
    }
  }
}

struct EditMode_Previews: PreviewProvider {
  static var previews: some View {
    EditMode()
  }
}
