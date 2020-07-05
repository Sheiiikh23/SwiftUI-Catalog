//
//  ToggleStyleModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Nouveau ToggleStyle modifier pour les toggle :
/// Disponible sur i•Pad•OS / watchOS / macOS / Mac Catalyst
///
/// ToggleStyle présents nativement:
///   • DefaultToggleStyle ––> par défaut, vert
///   • SwitchToggleStyle ––> pareil que DefaultToggleStyle
///   • SwitchToggleStyle(tint: Color) ––> custom le "foregroundColor" du toggle lorsque la value est true
///   • CustomToggleStyle

// MARK: - Utilisation : Custom la UI d'une Toggle View

struct ToggleStyleModifier: View {

  @State private var toggleValue = true

  var body: some View {
    VStack(spacing: 50) {

      /// DefaultToggleStyle
      Toggle(isOn: $toggleValue) {
        Text("Look at this default toggleStyle")
      }
      .toggleStyle(DefaultToggleStyle())

      /// SwitchToggleStyle sans tint ––> pareil que le default
      Toggle(isOn: $toggleValue) {
        Text("Look again at this default toggleStyle")
      }
      .toggleStyle(SwitchToggleStyle())

      /// SwitchToggleStyle avec une tint custom
      Toggle(isOn: $toggleValue) {
        Text("Look at this beautiful toggleStyle")
      }
      .toggleStyle(SwitchToggleStyle(tint: .orange))

      /// SwitchToggleStyle avec une tint custom
      Toggle(isOn: $toggleValue) {
        Text("Look (again) at this beautiful toggleStyle")
      }
      .toggleStyle(SwitchToggleStyle(tint: .pink))
    }
  }
}

/// Créer un CustomToggleStyle 
struct CustomToggleStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    Toggle(configuration)
      .foregroundColor(.pink)
  }
}

struct ToggleStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    ToggleStyleModifier()
  }
}
