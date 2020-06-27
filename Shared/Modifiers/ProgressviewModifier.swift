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
///  • LinearProgressViewStyle ––> permet de transformer un Circulaire en Linéaire
///  • CircularProgressViewStyle ––> permet de transformer un Linéaire en Circulaire
///
/// Créer un ProgressViewStyle custom:
///  • struct conforme au protocol ProgressViewStyle ––> fonction makeBody


struct ProgressviewModifier: View {

  @State private var valueProgressView = 0.5

  var body: some View {
    VStack(spacing: 50) {

      /// Default
      /// Ici aucune value donc Ciculaire
      ProgressView("Default indeterminate progressView")
        .accentColor(.pink) /// Rappel: Modifier pas appliqué car Circulaire
        .font(.title3) /// Rappel : Modifier appliqué car Circulaire
        /// Activer / désactiver ce modifier ne provequera aucun changement
        .progressViewStyle(DefaultProgressViewStyle())

      /// Default
      /// Ici value donc Linéaire
      /// Rappel ici pas de total donc par défaut = 1
      ProgressView("Default determinate progressview", value: valueProgressView)
        .accentColor(.pink) /// Rappel: Modifier appliqué car Linéaire
        .font(.title3) /// Rappel: Modifier pas appliqué car Linéaire
        /// Activer / désavtiver ce modifier ne provequera aucun changement
        .progressViewStyle(DefaultProgressViewStyle())

      /// Circulaire ––> Linéaire
      /// Ici value en dure car on fait passer un Circulaire en Linéaire
      /// Rappel: total par défaut = 1
      ProgressView("Indeterminate progressView into determinate one", value: 0.1)
        .accentColor(.pink) /// Modifier appliqué car le Circulaire devient Linéaire
        .font(.title) // Modifier pas appliqué car le Circulaire deviant Linéaire
        .progressViewStyle(LinearProgressViewStyle()) /// Modifier qui transforme un Circulaire en Linéaire

      /// Linéaire ––> Circulaire
      /// Ici value dynammique mais qui "ne sert pas à grand chose"
      /// Rappel: total par défaut = 1, ici je décide de le custom
      ProgressView("Determinate progressView into indeterminate one", value: valueProgressView, total: 5)
        .accentColor(.pink) /// Modifier pas appliqué car le Linéaire devient Circulaire
        .font(.subheadline) /// Modifier appliqué car le Linéaire devient Circulaire
        .progressViewStyle(CircularProgressViewStyle()) /// Modifier qui transforme un Linéaire en Circulaire

      /// CustomProgressViewStyle
      /// Ici appliqué sur un Circulaire
      ProgressView("Circular CustomProgressView")
        .accentColor(.pink) /// Modifier pas appliqué car Circulaire
        .font(.subheadline) /// Modifier appliqué car Circulaire
        .progressViewStyle(CustomProgressViewStyle())

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
