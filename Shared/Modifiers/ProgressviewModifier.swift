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
///  • DefaultProgressViewStyle ––> par défaut (indéterminé = Circulaire / déterminé = Linéaire)
///
///  • LinearProgressViewStyle ––> permet de forcer le LinearStyle (déterminé ou non)
///  • LinearProgressViewStyle(tint: Color) ––> permet de préciser la couleur
///
///  • CircularProgressViewStyle ––> permet de forcer le CircularStyle
///  • CircularProgressViewStyle(tint: Color) ––> permet de spécifier la couleur
///
/// Créer un ProgressViewStyle custom:
///  • struct conforme au protocol ProgressViewStyle ––> fonction makeBody

// MARK: - Utilisation : Permet de customiser la UI d'une ProgressView

struct ProgressviewModifier: View {

  @State private var valueProgressView = 0.5

  var body: some View {
    VStack(spacing: 50) {

      /// Default
      /// Ici aucune value donc Ciculaire
      ProgressView("Default indeterminate progressView")
        .font(.title3) /// Rappel : Modifier appliqué car Circulaire
        .progressViewStyle(CircularProgressViewStyle(tint: .green))

      /// Default
      /// Ici value donc Linéaire
      /// Rappel ici pas de total donc par défaut = 1
      ProgressView("Default determinate progressview", value: valueProgressView)
        .font(.title3) /// Rappel: Modifier pas appliqué car Linéaire
        .progressViewStyle(LinearProgressViewStyle(tint: .pink))

      /// Circulaire ––> Linéaire
      /// Ici value en dure car on fait passer un Circulaire en Linéaire
      /// Rappel: total par défaut = 1
      ProgressView("Indeterminate progressView into determinate one", value: 0.1)
        .font(.title) // Modifier pas appliqué car le Circulaire deviant Linéaire
        .progressViewStyle(LinearProgressViewStyle(tint: .pink)) /// Modifier qui transforme un Circulaire en Linéaire

      /// Linéaire ––> Circulaire
      /// Ici value dynammique mais qui "ne sert pas à grand chose"
      /// Rappel: total par défaut = 1, ici je décide de le custom
      ProgressView("Determinate progressView into indeterminate one", value: valueProgressView, total: 5)
        .font(.subheadline) /// Modifier appliqué car le Linéaire devient Circulaire
        .progressViewStyle(CircularProgressViewStyle(tint: .green)) /// Modifier qui transforme un Linéaire en Circulaire

      /// CustomProgressViewStyle
      /// Ici appliqué sur un Circulaire
      ProgressView("Circular CustomProgressView")
        .font(.subheadline) /// Modifier appliqué car Circulaire
        .progressViewStyle(CustomProgressViewStyle())
        .progressViewStyle(CircularProgressViewStyle(tint: .green))

      /// CustomProgressViewStyle
      /// Ici appliqué sur un Linéaire
      ProgressView("Linar CustomProgressView", value: valueProgressView)
        .accentColor(Color.purple.opacity(0.5)) /// Modifier appliqué car Linéaire
        .font(.title) /// Modifier pas appliqué car Linéaire
        .padding()
        .progressViewStyle(CustomProgressViewStyle())
    }
  }
}

#warning("Regarder pour qu'un ProgressviewStyle s'applique uniquement sur les Circulaires / Linéaires ")
struct CustomProgressViewStyle: ProgressViewStyle {
  func makeBody(configuration: Configuration) -> some View {
    ProgressView(configuration)
      .padding()
      .border(Color.red, width: 10)
      .cornerRadius(5)
      .shadow(color: Color.red.opacity(0.5), radius: 5, x: 10, y: 5)

  }
}


struct ProgressviewModifier_Previews: PreviewProvider {
  static var previews: some View {
    ProgressviewModifier()
      .preferredColorScheme(.dark)
  }
}
