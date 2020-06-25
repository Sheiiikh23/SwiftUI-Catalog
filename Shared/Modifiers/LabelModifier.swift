//
//  LabelModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// Modifier disponibles pour les Labels :
/// - labelStyle(LabelStyleConfiguration) ––> i•Pad•OS / watchOS / tvOS / macOs / Mac Catalyst
  /// LabelStyleConfiguration :
    /// • DefaultLabelStyle ––> par défaut
    /// • TitleOnlyLabelStyle ––> uniquement le title
    /// • IconOnlyLabelStyle ––> uniquement l'icon
    /// • CustomLabelStyle ––> à créer à la mano
  /// Un même labelStyle peut être set pour un container

struct LabelModifier: View {
  var body: some View {
    NavigationView {
      VStack(spacing: 50) {
        /// Default
        Label("Default label style", systemImage: "folder")
          .font(.title)
          /// Activer / désactiver ce modifier ne changera pas l'apparence du label
          .labelStyle(DefaultLabelStyle())

        /// TitleOnly
        Label("Title only label style", systemImage: "folder.fill")
          .font(.title)
          .labelStyle(TitleOnlyLabelStyle())

        /// IconOnly
        Label("Icon only label style", systemImage: "folder.fill")
          .font(.title)
          .labelStyle(IconOnlyLabelStyle())

        /// CustomLabelStyle
        Label("Custom label style", systemImage: "slider.horizontal.3")
          .font(.title)
          .labelStyle(CustomLabelStyle())

        /// Même labelStyle pour un container
        VStack(spacing: 20) {
          Label("Même label style pour ce container", systemImage: "slider.horizontal.3")
            .font(.subheadline)
          Label("Même label style pour ce container", systemImage: "slider.horizontal.3")
            .font(.subheadline)
          Label("Même label style pour ce container", systemImage: "slider.horizontal.3")
            .font(.subheadline)
          Label("Même label style pour ce container", systemImage: "slider.horizontal.3")
            .font(.subheadline)
        }
        .labelStyle(CustomLabelStyle())
        .padding()
        .background(Color.pink)
      }
    }
  }
}

struct CustomLabelStyle: LabelStyle {
  func makeBody(configuration: Configuration) -> some View {
    Label(configuration)
      .border(Color.red)
      .background(Color.yellow)
  }
}

struct LabelModifier_Previews: PreviewProvider {
  static var previews: some View {
    LabelModifier()
  }
}
