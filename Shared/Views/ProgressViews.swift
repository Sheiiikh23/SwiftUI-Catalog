//
//  ProgressViews.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// Apparition des ProgressView: circulaire ou linéaire
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Cataclyst
  /// Circulaire: par défaut si aucune value n'est donnée à la progressView
  /// Linéaire: par défaut si une value est donnée à la progressView

/// A noter :
///   • accentColor ––> effectif uniquement sur la progressView et si "déterminée"
///   • foregroundColor ––> modifie uniquement la couleur de Text

struct ProgressViews: View {

  @State private var valueProgressView: CGFloat = 0.5

  var body: some View {
    VStack(spacing: 50) {
      /// Créer une progressView indéterminée (sans value) ––> Circulaire
      ProgressView()
        .scaleEffect(1.5, anchor: .center)
        .accentColor(.green) /// pas de value donc n'est pas effectif

      /// Créer une progressView indéterminée avec une String ––> Circulaire
      ProgressView("Constructeur n°2")
        .foregroundColor(.green)

      /// Créer une progressView déterminée (avec value) avec une String ––> Linéaire
      ProgressView("Constructeur n°3", value: valueProgressView)

      /// Créer une progressView déterminée (avec value) avec une String, et un total custom ––> Linéaire
      ProgressView("Constructeur n°4", value: valueProgressView, total: 5)
        /// Changer la couleur de texte
        .foregroundColor(.red)
        .accentColor(.purple)

      /// Créer une progressView indeterminée avec un Text ––> Circulaire
      /// Avantage de ce constructeur: possibilité de custom le Text
      /// "Iconvénient": syntaxe (beaucoup plus "lourde" que celle ci-dessus)
      ProgressView {
        Text("Constructeur n°5")
          .font(.title3)
          .fontWeight(.bold)
      }

      /// Créer une progressView déterminée sans String ––> Linéaire
      ProgressView(value: valueProgressView)
        .accentColor(.yellow)

      /// Créer une progressView déterminée avec un label custom ––> Linéaire
      ProgressView(value: valueProgressView, label: {
        HStack {
          Spacer()
          Text("Constructeur n°7")
            .fontWeight(.heavy)
          Spacer()
        }
      })

      /// Créer une progressView déterminée avec total & pas de String ––> Linéaire
      ProgressView(value: valueProgressView, total: 1.0)

      /// Créer une progressView déterminée avec un total & label custom ––> Linéaire
      ProgressView(value: valueProgressView, total: 1, label: {
        Text("Constructeur 9")
      })


    }
  }
}

struct ProgressView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ProgressViews()
        .previewDevice("iPhone 11 Pro Max")
      ProgressViews()
        .previewDevice("iPad Air (3rd generation)")
    }
  }
}
