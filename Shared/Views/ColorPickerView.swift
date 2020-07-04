//
//  ColorPickerView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 01/07/2020.
//

import SwiftUI

/// Apparition du ColorPicker
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// Plusieurs constructeurs disponibles: 1 "compact" / 1 permettant plus de custom pour le Text
///   • ColorPicker(Title, selection: ...)
///   • ColorPicker(Title, selection: ..., supportOpacity: ...)
///   • ColorPicker(selection: ...) { ... }
///   • ColorPicker(selection: ..., supportOppacity: ...) { ... }
///   supportOpacity = true par défaut, même si on ne le mentionne pas

struct ColorPickerView: View {

  @State private var colorValue = Color.white

  var body: some View {
    VStack {

      /// Constructeur n°1: supportsOpacity = true par défaut
      ColorPicker("Choose a color", selection: $colorValue)
        .frame(width: 200, height: 200)

      /// Constructeur n°2: permet de passer supportsOpacity à false
      ColorPicker("Choose a color", selection: $colorValue, supportsOpacity: false)
        .frame(width: 200, height: 200)

      /// Constructeur n°3: permet plus de custom sur le Text
      /// supportsOpacity = true par défaut
      ColorPicker(selection: $colorValue) {
        Text("Choose a color")
          .font(.title3)
          .fontWeight(.bold)
      }
      .frame(width: 200, height: 200)

      /// Constructeur n°4: permet plus de custom sur le Text
      /// Permet également de passer supportsOpacity à false
      ColorPicker(selection: $colorValue, supportsOpacity: false) {
        Text("Chose a color")
          .font(.title3)
          .fontWeight(.bold)
      }
      .frame(width: 200, height: 200)
    }
  }
}

struct ColorPickerView_Previews: PreviewProvider {
  static var previews: some View {
    ColorPickerView()
  }
}
