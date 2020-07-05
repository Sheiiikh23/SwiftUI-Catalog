//
//  OnChangeModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// onChange peut maintenant prendre en paramètre des @State / @Binding etc...

// MARK: - Utilisation : Permet d'observer la modification de n'importe quel Binding et de potentiellement réagir en fonction du changement

#warning("refacto")

struct OnChangeModifier: View {

  @State private var name = ""

  var body: some View {
    TextField("Enter your name:", text: $name)
      .textFieldStyle(RoundedBorderTextFieldStyle())
      .padding()
      .onChange(of: name) { value in
        print(value)
      }
  }
}
