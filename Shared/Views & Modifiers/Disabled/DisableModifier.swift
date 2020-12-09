//
//  DisableModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 09/12/2020.
//

import SwiftUI

/// disabled permet d'activer ou désactiver la possibilité d'interagir avec des View (généralement des contrôles)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOs / Mac Catalyst
///

// MARK: - Utilisation : Permet d'activer / désactiver l'interaction avec une vue

struct DisableModifier: View {

  @State private var isDisabled = false
  @State private var textFieldValue = ""
  @State private var color1 = Color.red

  var body: some View {
    VStack(spacing: 75) {
      Toggle(isOn: $isDisabled) {
        Text(isDisabled ? "Activate controls" : "Disable controls")
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(.secondary)
      }
      .toggleStyle(NotSpacedToggleStyle())

      TextField(isDisabled ? "Textfield disable" : "Enter your name", text: $textFieldValue)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .disabled(isDisabled)

      Button { color1 = randomColor() } label: {
        Text(isDisabled ? "Button disable" : "Change color")
          .fontWeight(.bold)
          .foregroundColor(.white)
          .padding(.horizontal, 20)
          .padding(.vertical)
          .background(color1)
          .cornerRadius(20)
      }
      .disabled(isDisabled)
    }
  }

  private func randomColor() -> Color {
    let colors: [Color] = [.red, .blue, .green, .orange, .pink, .yellow, .gray, .purple]
    return colors.randomElement() ?? colors[1]
  }
}

fileprivate struct NotSpacedToggleStyle: ToggleStyle {

  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Toggle("", isOn: configuration.$isOn)
        .labelsHidden()
        .toggleStyle(SwitchToggleStyle(tint: .purple))
      configuration.label
    }
  }
}

struct DisableModifier_Previews: PreviewProvider {
  static var previews: some View {
    DisableModifier()
  }
}
