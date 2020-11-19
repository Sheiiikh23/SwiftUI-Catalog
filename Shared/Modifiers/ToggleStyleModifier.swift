//
//  ToggleStyleModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Modifier propre pour les Toggle :
/// Disponible sur i•Pad•OS / watchOS / macOS / Mac Catalyst
///
/// ToggleStyle présents nativement:
///  • DefaultToggleStyle : par défaut, vert
///  • SwitchToggleStyle : pareil que DefaultToggleStyle
///  • SwitchToggleStyle(tint: Color) : permet de custom la
///
/// Créer un ToggleStyle custom
///  • struct conforme au protocol ToggleStyle ––> fonction makeBody

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

      Toggle(isOn: $toggleValue) {
        Text("Checkbox as toggle")
      }
      .toggleStyle(CheckboxToggleStyle())

      Toggle(isOn: $toggleValue) {
        Text("Toggle without spacer")
      }
      .toggleStyle(ToggleWithoutSpacergStyle())
    }
  }
}


struct CheckboxToggleStyle: ToggleStyle {

  func makeBody(configuration: Configuration) -> some View {
    HStack {
      configuration.label
        .foregroundColor(configuration.isOn ? .green : .red)
      Spacer()
      Image(systemName: configuration.isOn ? "checkmark.square" : "square")
        .font(.system(size: 34, weight: .bold))
        .foregroundColor(configuration.isOn ? .green : .red)
        .onTapGesture { configuration.isOn.toggle() }
    }
  }
}

struct ToggleWithoutSpacergStyle: ToggleStyle {

  func makeBody(configuration: Configuration) -> some View {
    HStack {
      configuration.label
      Toggle("", isOn: configuration.$isOn)
        .labelsHidden()
        .toggleStyle(SwitchToggleStyle(tint: .purple))
    }
  }
}

struct ToggleStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ToggleStyleModifier()
        .preferredColorScheme(.dark)
    }
  }
}
