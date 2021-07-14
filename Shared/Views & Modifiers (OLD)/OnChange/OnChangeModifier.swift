//
//  OnChangeModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// onChange permet d'exécuter une / des actions lorsqu'une variable change de valeur
/// Disponible sur : i•Pad•OS / watchOS / tvOS / MacOS / Mac Catalyst
///
/// Le modifier peut également être appellé pour des @State / @Binding variable

// MARK: - Utilisation : Exécuter une / des actions lorsqu'une variable change de valeur

struct OnChangeModifier: View {

  @State private var name = ""

  var body: some View {
    TextField("Enter your name :", text: $name)
      .autocapitalization(.none)
      .disableAutocorrection(true)
      .textFieldStyle(RoundedBorderTextFieldStyle())
      .padding()
      .onChange(of: name) { newName in
        print("Name was changed to : \(newName)")
      }
  }
}
