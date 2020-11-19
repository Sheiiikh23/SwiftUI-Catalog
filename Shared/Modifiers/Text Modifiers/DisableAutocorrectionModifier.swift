//
//  DisableAutocorrectionModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import SwiftUI

/// DisableAutocorrection permet de désactiver la correction automatique
/// Disponible sur : i•Pad•OS / tvOS / macOS / Mac Catalyst
///
/// Très utile pour les désactiver l'auto corrections pour TextField et TextEditor

// MARK: - Utilisation : Désactiver l'auto correction (TextField, TextEditor...)

struct DisableAutocorrectionModifier: View {

  @State private var valueTextField = ""
  @State private var valueTextEditor = ""

  var body: some View {
    VStack {
      TextField("No auto correction : ", text: $valueTextField)
        .disableAutocorrection(true)
        .padding()
        .textFieldStyle(RoundedBorderTextFieldStyle())

      TextEditor(text: $valueTextEditor)
        .textCase(.uppercase)
        .disableAutocorrection(true)
        .frame(height: 350)
    }
  }
}

struct DisableAutocorrectionModifier_Previews: PreviewProvider {
    static var previews: some View {
      DisableAutocorrectionModifier()
    }
}
