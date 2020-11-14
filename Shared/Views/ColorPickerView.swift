//
//  ColorPickerView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 01/07/2020.
//

import SwiftUI

/// Apparition du ColorPicker qui permet de sélectionner une couleur (de plusieurs manières)
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// Prend toute la width du parent container par défaut
/// Le colorPicker supporte l'opacité par défaut (possibilité de le désactivé)

// MARK: - Utilisation : Color Picker pour la sélection de couleur(s) par l'utilisateur

struct ColorPickerView: View {

  @State private var colorValue = Color.orange

  var body: some View {
    VStack(spacing: 50) {

      /// ColorPicker avec une String en tant que Title (support de l'opacité)
      ColorPicker("Choose a color", selection: $colorValue)

      /// ColorPicker avec une String en tant que Title (support de l'opacité désactivé)
      ColorPicker("Choose a color", selection: $colorValue, supportsOpacity: false)

      /// ColorPicker avec une View en tant que Label (support de l'opacité activé)
      /// Plus personnalisable
      ColorPicker(selection: $colorValue) {
        Text("Choose a color")
          .font(.title3)
          .fontWeight(.bold)
      }

      /// ColorPicker avec une View en tant que Label (support de l'opacité désactivé)
      /// Plus personnalisable
      ColorPicker(selection: $colorValue, supportsOpacity: false) {
        Text("Choose a color")
          .font(.title3)
          .fontWeight(.bold)
      }
    }
  }
}

struct ColorPickerView_Previews: PreviewProvider {
  static var previews: some View {
    ColorPickerView()
  }
}
