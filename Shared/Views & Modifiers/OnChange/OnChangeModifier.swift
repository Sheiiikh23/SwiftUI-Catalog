//
//  OnChangeModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// onChange peut maintenant prendre en paramètre des @State / @Binding etc...

// MARK: - Utilisation : Permet d'observer la modification de n'importe quel Binding et de potentiellement réagir en fonction du changement

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
