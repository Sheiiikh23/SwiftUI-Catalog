//
//  ProgressViews.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// Apparition des ProgressView: Circulaire (non déterminé) ou Linéaire (déterminé)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Cataclyst
/// 
/// Circulaire: par défaut si aucune value n'est donnée à la progressView
/// Linéaire: par défaut si une value avec un total (par défaut = 1) à la progressView

/// Modifiers notables sur cette View:
///   • accentColor ––> effectif uniquement sur la progressView Linéaire sur i•Pad•OS
///   • foregroundColor ––> modifie uniquement la couleur de Text Circulaire & Linéaire
///   • font ––> effectif uniquement sur les progressView Circulaire sur i•Pad•OS
///   • frame ––> la width fonctionne uniquement sur les Linéaire • agit comme un padding sur le Circulaire – la height agit comme un padding (n'aggrandit pas la height de la bar mais agrandit celle de la View en elle-même) sur i•Pad•OS
///   • cornerRadius ––> ne fonctionne pas sur le Linéaire et n'a pas d'intêrét sur le Circulaire (mais fonctionne tout de même) sur i•Pad•OS

// MARK: - Utilisation : Montrer la progression d'un chargement / état

struct ProgressViews: View {

  @State private var valueProgressView: CGFloat = 0.5

  var body: some View {
    ScrollView {
      VStack(spacing: 50) {

        // MARK: - ProgressView Circulaire (= indéterminé)

        /// Créer une progressView Circulaire (indérminée càd sans value)
        ProgressView()
          /// Modifiers pour la ProgressView
          .scaleEffect(1.5, anchor: .center)
          .accentColor(.green) /// Modifier pas appliqué car Circulaire
          .frame(width: 200) /// frame qui agit comme un padding

        /// Créer une progressView Circulaire avec une String
        ProgressView("Constructeur n°2")
          /// Modifiers pour le Text et pour la ProgressView
          .foregroundColor(.green) /// change UNIQUEMENT la couleur du text
          .font(.title) /// Modifier bien appliqué car Circulaire


        /// Créer une progressView Circulaire avec un Text
        /// Avantage de ce constructeur: possibilité de custom le Text
        /// "Iconvénient": syntaxe (beaucoup plus "lourde" que celle ci-dessus)
        ProgressView {
          Text("Constructeur n°3")
            /// Modifiers pour le Text uniquement
            .font(.title3) /// Modifier bien appliqué car Circulaire
            .fontWeight(.bold)
            .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
            .textCase(.uppercase)
        }
        .accentColor(.red) /// Modifier pas appliqué car Circulaire

        // MARK: - ProgressView Linéaire (déterminé)

        /// Créer une progressView Linéaire (déterminé càd avec value, total = 1) sans String
        ProgressView(value: valueProgressView)
          /// Modifiers pour le Text et pour la ProgressView
          .accentColor(.yellow) /// Modifier bien appliqué car Linéaire
          .cornerRadius(20) /// Modifier pas appliqué car Linéaire
          .padding()


        /// Créer une progressView Linéaire (rappel total = 1) avec une String
        ProgressView("Constructeur n°5", value: valueProgressView)
          /// Modifiers pour le Text et pour la ProgressView
          .font(.title) /// Modifier pas appliqué car Linéaire
          .foregroundColor(.red) /// Change UNIQUEMENT la couleur du Text
          .accentColor(.purple) /// Modifier appliqué car Linéaire


        /// Créer une progressView Linéaire avec une String, et un total custom
        ProgressView("Constructeur n°6", value: valueProgressView, total: 5)
          /// Modifiers pour le Text et pour la progressView
          .font(.title) /// Modifier pas appliqué car Linéaire
          .foregroundColor(.red)
          .accentColor(.purple) /// Modifier appliqué car Linéaire

        /// Créer une progressView Linéaire avec total & pas de String
        ProgressView(value: valueProgressView, total: 1.0)
          .accentColor(Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)).opacity(0.75))
          .frame(width: 300) /// Modifier qui fonctionne uniquement pour la width

        /// Créer une ProgressView Linéaire avec un label custom
        ProgressView(value: valueProgressView, total: 1, label: {
          HStack {
            Spacer()
            Text("Constructeur n°8")
              /// Modifiers pour le Text uniquement
              .font(.title)
              .fontWeight(.heavy)
              .padding(5)
              .background(Color.purple)
            Spacer()
          }
          /// Modifiers appliqués pour le HStack uniquement
          .background(Color.orange)
          .cornerRadius(15)
          .padding()
        })
        /// Modifiers pour la ProgressView
        .accentColor(.pink) /// Modifier appliqué car Linéaire
        .padding(5)
        .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))

        /// Créer une progressView Linéaire avec un total & label custom
        ProgressView(value: valueProgressView, total: 3) {
          Text("Constructeur 9")
            /// Modifiers appliqués pour le Text uniquement
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
        }
        /// Modifier pour la ProgressView
        .accentColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))) /// Modifier appliqué car Linéaire

        Group {
          ProgressView(value: valueProgressView) {
            Text("Description of the task")
              .font(.title3)
              .fontWeight(.bold)
          } currentValueLabel: {
            Text("Current Value of the task")
              .font(.subheadline)
              .fontWeight(.semibold)
          }
          .progressViewStyle(CircularProgressViewStyle())


          ProgressView(value: valueProgressView) {
            Text("Description of the task")
              .font(.title3)
              .fontWeight(.bold)
          } currentValueLabel: {
            Text("Current Value of the task ")
              .font(.subheadline)
              .fontWeight(.semibold)
          }
          .progressViewStyle(LinearProgressViewStyle())
          
        }
      }
    }
  }
}

struct ProgressView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ProgressViews()
        .previewDevice("iPhone 11 Pro Max")
      ProgressViews()
        .previewDevice("iPhone 11 Pro Max")
    }
  }
}
