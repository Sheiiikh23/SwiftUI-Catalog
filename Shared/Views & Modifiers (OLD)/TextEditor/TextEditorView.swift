//
//  TextEditorView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Apparition du TextEdit qui est un "TextField multiline"
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// Unique Constructeur :
///   • TextEditor(text: )
/// Possède les mêmes modifiers qu'un Text View mais pas de fontWeight disponible
/// Vient avec une ScrollView par défaut si la longueur du texte est supérieur à la height de la View

// MARK: - Utilisation : Pour un TextField avec plusieurs lignes :] 

struct TextEditorView: View {

  @State private var firstValue = "Hello multiline textfield"
  @State private var secondValue = "Hello multineline textfield with line limit"

  var body: some View {
    VStack {
      /// TextEditor sans aucunes restriction
      TextEditor(text: $firstValue)
          .font(.callout)
         .foregroundColor(.red)
        .padding()

      /// TextEdit avec au maximum 3 ligne de input (bugger pour le moment)
      TextEditor(text: $secondValue)
        .lineLimit(3)
        .font(.callout)
        .foregroundColor(.blue)
        .truncationMode(.tail)
        .padding() 
    }
  }
}

struct TextEditorView_Previews: PreviewProvider {
  static var previews: some View {
    TextEditorView()
  }
}
