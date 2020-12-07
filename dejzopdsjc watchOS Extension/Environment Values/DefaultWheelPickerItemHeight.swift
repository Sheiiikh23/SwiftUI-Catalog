//
//  DefaultWheelPickerItemHeight.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 08/09/2020.
//

import SwiftUI

/// defaultWheelPickerItemHeight indique la taille par défaut d'un picker avec un WheelPickerStyle
/// Disponible sur : watchOS
///
/// truncationMode: CGFloat { get set } 

// MARK: - Importance pour l'accessibilité : moyenne
// MARK: - Utilisation : Permet de capter la taille par défaut propre à chaque user

struct DefaultWheelPickerItemHeight: View {

  @Environment(\.defaultWheelPickerItemHeight) var wheelHeight
  @State private var selectedColor = 0

  var body: some View {
    VStack {
      Picker(selection: $selectedColor, label: Text("Pick a color")) {
        Text("RED").tag(1)
        Text("YELLOW").tag(2)
        Text("GREEN").tag(3)
      }
      .pickerStyle(WheelPickerStyle())
      .frame(height: wheelHeight + 50)
    }
  }
}

struct DefaultWheelPickerItemHeight_Previews: PreviewProvider {
  static var previews: some View {
    DefaultWheelPickerItemHeight()
  }
}
