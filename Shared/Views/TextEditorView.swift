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
/// Possède les mêmes modifiers qu'un Text View mais pas de fontWeight

struct TextEditorView: View {

  @State private var textEditorValue = "Hello multiline textfield"

  var body: some View {
    NavigationView {
      TextEditor(text: $textEditorValue)
        .font(.title)
        .foregroundColor(.red)
        .lineSpacing(5)
    }
  }
}

struct TextEditorView_Previews: PreviewProvider {
  static var previews: some View {
    TextEditorView()
  }
}
