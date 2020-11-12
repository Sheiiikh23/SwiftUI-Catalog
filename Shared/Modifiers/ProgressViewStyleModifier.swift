//
//  ProgressviewModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 25/06/2020.
//

import SwiftUI

/// Modifier propre pour les ProgressView :
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///   
/// ProgressViewStyle présents nativement :
///  • Spinner : CircularProgressViewStyle(tint: Color) ––> permet de préciser la couleur du spinner
///  • Bar : LinearProgressViewStyle(tint: Color) ––> permet de spécifier la couleur de la bar
///
/// Créer un ProgressViewStyle custom:
///  • struct conforme au protocol ProgressViewStyle ––> fonction makeBody

// MARK: - Utilisation : Permet de customiser la UI d'une ProgressView

struct ProgressViewStyleModifier: View {

  @State private var valueProgressView = 0.5

  var body: some View {
    VStack(spacing: 50) {

      // MARK: - CircularProgressViewStyle
      ProgressView()
        .progressViewStyle(CircularProgressViewStyle(tint: .green))

      // MARK: - LinearProgressViewStyle
      ProgressView(value: valueProgressView)
        .progressViewStyle(LinearProgressViewStyle(tint: .pink))

      // MARK: - Custom ProgressViewStyle
      // Spinner
      ProgressView()
        .progressViewStyle(CustomProgressViewStyle())

      // Bar
      ProgressView(value: valueProgressView)
        .progressViewStyle(CustomProgressViewStyle())
    }
  }
}

struct CustomProgressViewStyle: ProgressViewStyle {
  func makeBody(configuration: Configuration) -> some View {
    ProgressView(configuration)
      .padding()
      .border(Color.red, width: 10)
      .cornerRadius(5)
      .shadow(color: Color.red.opacity(0.2), radius: 5, x: 0, y: 5)
  }
}


struct ProgressviewModifier_Previews: PreviewProvider {
  static var previews: some View {
    ProgressViewStyleModifier()
      .preferredColorScheme(.dark)
  }
}
