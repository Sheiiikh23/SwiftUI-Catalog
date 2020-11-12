//
//  ProgressViews.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// Apparition des ProgressView: spinner ou bar
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Cataclyst
/// 
/// Spinner: par défaut si aucune value n'est donnée à la progressView
/// Bar: par défaut si une value avec un total (par défaut = 1) à la progressView

// MARK: - Utilisation : Montrer la progression d'un chargement / état

struct ProgressViews: View {

  @State private var valueProgressView: CGFloat = 0.5

  var body: some View {
    VStack(spacing: 50) {

      // MARK: - ProgressView spinner

      /// progressView spinner
      ProgressView()

      /// progressView avec une String en tant que Title
      ProgressView("Constructeur n°2")
        .textCase(.lowercase)

      /// progressView avec une View en tant que Label
      ProgressView {
        Text("Constructeur n°3")
          .fontWeight(.bold)
          .padding(.horizontal, 20)
          .padding(.vertical)
          .background(Color.pink.opacity(0.5))
          .cornerRadius(20)
      }

      // MARK: - ProgressView bar

      /// progressView bar (total = 1 par défaut)
      ProgressView(value: valueProgressView)

      // progressView bar avec un total custom
      ProgressView(value: valueProgressView, total: 5)

      /// progressView bar avec une String en tant que Title (total = 1)
      ProgressView("Constructeur n°4", value: valueProgressView)
        .textCase(.lowercase)

      /// progressView bar avec une String en tant que Title + total custom
      ProgressView("Constructeur n°5", value: valueProgressView, total: 5)
        .textCase(.lowercase)

      /// progressView bar avec une View en tant que Label (total = 1)
      ProgressView(value: valueProgressView) {
        Label("Constructeur n°6", systemImage: "gear")
          .padding(.leading, 5)
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
