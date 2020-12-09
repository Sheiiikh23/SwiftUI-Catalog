//
//  DefaultWheelPickerItemHeight.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 09/12/2020.
//
import SwiftUI

/// defaultWheelPickerItemHeight permet de connaître et de setter la height d'une row d'un picker avec un WheelPickerStyle
/// Disponible sur : watchOS / Mac Catalyst
///
/// defaultWheelPickerItemHeight: CGFloat { get set }

// MARK: - Importance pour l'accessibilité : très faible – faible
// MARK: - Utilisation : Permet de connaître la height des rows d'un WheelPickerStyle et de la modifier au besoin

struct DefaultWheelPickerItemHeight: View {

  @Environment(\.defaultWheelPickerItemHeight) private var wheelHeight
  @State private var selectedColor = 0

  var body: some View {
    VStack {
      Picker(selection: $selectedColor, label: Text("Pick a color")) {
        Text("RED")
          .tag(1)
        Text("YELLOW")
          .tag(2)
        Text("GREEN")
          .tag(3)
      }
      .pickerStyle(WheelPickerStyle())
    }
    /// Augmentation de la height des rows
    .environment(\.defaultWheelPickerItemHeight, 125)
  }
}

struct DefaultWheelPickerItemHeight_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      DefaultWheelPickerItemHeight()
      DefaultWheelPickerItemHeight()
        .environment(\.defaultWheelPickerItemHeight, 100)
      DefaultWheelPickerItemHeight()
        .environment(\.defaultWheelPickerItemHeight, 250)
    }
  }
}
