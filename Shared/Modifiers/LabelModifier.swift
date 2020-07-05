//
//  LabelModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// Modifier propre pour les Label :
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOs / Mac Catalyst
///   
/// LabelStyle présents nativement :
///   • DefaultLabelStyle ––> par défaut
///   • TitleOnlyLabelStyle ––> uniquement le title
///   • IconOnlyLabelStyle ––> uniquement l'icon
///
/// Créer un LabelStyle custom :
///   • struct conforme au protocol LabelStyle ––> fonction makeBody
///
/// Un même labelStyle peut être set pour un container

// MARK: - Utilisation : Custom la UI d'un Label View

struct LabelModifier: View {
  var body: some View {
    NavigationView {
      VStack(spacing: 50) {

        /// Default
        Label("Default label style", systemImage: "folder")
          .font(.title)
          /// Activer / désactiver ce modifier ne provoquera aucun changement
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

        /// Même labelStyle pour un container, ici j'ai chosi d'appliquer le CustomLabelStyle
        VStack(spacing: 20) {
          Label("Même label style pour ce container", systemImage: "slider.horizontal.3")
            .font(.subheadline)
          Label("Même label style pour ce container", systemImage: "slider.horizontal.3")
            .font(.subheadline)
            .foregroundColor(.secondary)
          Label("Même label style pour ce container", systemImage: "slider.horizontal.3")
            .font(.subheadline)
          Label("Même label style pour ce container", systemImage: "slider.horizontal.3")
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        /// Modifier appliqué pour tout les labels du container
        .labelStyle(CustomLabelStyle())
        .padding()
        .background(Color.purple)

      }
    }
  }
}

struct CustomLabelStyle: LabelStyle {
  func makeBody(configuration: Configuration) -> some View {
    Label(configuration)
      .padding()
      .border(Color.red, width: 5)
      .cornerRadius(5)
      .background(Color.yellow)
  }
}

struct LabelModifier_Previews: PreviewProvider {
  static var previews: some View {
    LabelModifier()
      .preferredColorScheme(.light)
  }
}
