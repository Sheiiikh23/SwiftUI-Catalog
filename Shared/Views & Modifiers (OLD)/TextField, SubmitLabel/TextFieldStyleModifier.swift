//
//  TextFieldStyleModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 11/12/2020.
//

import SwiftUI

/// Modifier propre pour les TextField
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// TextFieldStyle présents nativement :
///   • DefaultTextFieldStyle : dépend du context et de la plateforme (style recommandé)
///   • PlainTextFieldStyle : textField sans aucune décoration
///   • RoundedBorderTextFieldStyle : i•Pad•OS / macOS / Mac Catalyst
///       - textfield avec une bordure + cornerRadius définie par le système
///   • SquareBorderTextFieldStyle : macOS / Mac Catalyst
///       - textfield avec une bordure carrée définie par le système

// MARK: - Utilisation : Custom la UI d'un TextField

// TODO: textfieldview avec le nouveau format
//TextField("heioi", value: .constant(""), format: .name(style: .medium))
//TextField("ziefh", text: .constant(""), prompt: Text("New activity"))


struct TextFieldStyleModifier: View {

  @State private var textFieldValue1 = ""
  @State private var textFieldValue2 = ""
  @State private var textFieldValue3 = ""

  var body: some View {
    VStack(spacing: 40) {

      /// DefaultTextFieldStyle
      TextField("Enter some value", text: $textFieldValue1)
        .textFieldStyle(DefaultTextFieldStyle())
        .padding(.horizontal, 10)

      /// PlainTextFieldStyle
      TextField("Enter some value", text: $textFieldValue2)
        .textFieldStyle(PlainTextFieldStyle())
        .padding(.horizontal, 10)

      /// RoundedBorderTextFieldStyle
      TextField("Enter some value", text: $textFieldValue3)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.horizontal, 10)

      /// SquareBorderTextFieldStyle
      #if os(macOS)
      TextField("Enter some value", text: $textFieldValue1)
        .textFieldStyle(SquareBorderTextFieldStyle())
      #endif
      }
  }
}


struct TextFieldStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    TextFieldStyleModifier()
  }
}
