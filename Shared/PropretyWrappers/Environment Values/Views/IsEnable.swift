//
//  IsEnable.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 10/09/2020.
//

import SwiftUI

/// isEnabled indique si la vue permet des interactions avec l'utilisateur
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// isEnabled: Bool { get set }
///   - true : par défaut
///   - false
///

// MARK: - Importance pour l'accessibilité : faible - très faible
// MARK: - Utilisation : 🤷‍♂️

struct IsEnable: View {

  @Environment(\.isEnabled) var isEnable

  var body: some View {
    Text("Hello, World!")
      .foregroundColor(isEnable ? .blue : .red)
  }
}

struct IsEnable_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      IsEnable()
        .environment(\.isEnabled, false)
      IsEnable()
        .environment(\.isEnabled, true)
    }
  }
}
