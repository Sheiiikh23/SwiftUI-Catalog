//
//  AccessibilityEnabled.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 22/07/2020.
//

import SwiftUI

/// accessibilityEnabled permet de détecter les personnes qui ont activés les text lu par Siri
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// accessibilityEnabled: Bool { get set } 
///   - false: par défaut
///   - true: si l'utisateur l'ativé
///
/// Il faut donc utiliser le modifier help afin de provider un text lu par Siri
/// Utilisation du modifier help : cf HelpModifier (+ localizedStringKey)
/// Ne fonctionne pas dans le simulateur

// MARK: - Importance pour l'accessibilité : moyenne - élevée
// MARK: - Utilisation : Pour les personnes malvoyantes

struct AccessibilityEnabled: View {

  @Environment(\.accessibilityEnabled) var isAccesibilityActivated

  var body: some View {
    ZStack {
      Color.purple.opacity(0.25).edgesIgnoringSafeArea(.all)
      // check si l'option d'accessibilité est activée
      if isAccesibilityActivated {
        VStack {
          Text("Spoken selection is activated !")
            .font(.title3)
            .fontWeight(.bold)
            .help("Accesibility is activated !")
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.green)
        .clipShape(Capsule())
      } else {
        VStack {
          Text("Accesibility isn't activated !")
            .font(.title3)
            .fontWeight(.bold)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.red)
        .clipShape(Capsule())
      }
    }
  }
}

struct AccessibilityEnabled_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AccessibilityEnabled()
      AccessibilityEnabled()
        .environment(\.accessibilityEnabled, true)
    }
  }
}
