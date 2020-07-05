//
//  LazyVStackView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 02/07/2020.
//

import SwiftUI

/// Appartion des LazyVStack : VStack où les cellules sont crées uniquement si besoin (comme pour les Grid)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
/// 
/// Prend toute la width à sa disposition
/// Même constructeurs que les VStacks avec en plus un PinnedScrollView (cf PinnedScrollView)

// MARK: - Utilisation : Création d'un VStack qui recycle ses cellules (recommandé lorsque la taille des données est importante)
#warning("TO DO – Constructeur avec le paramètre PinnedScrollView")

struct LazyVStackView: View {
  var body: some View {
    ScrollView {
      LazyVStack {
        ForEach(1...1000, id: \.self) { item in
          Text("Cell n°\(item)")
            .font(.title3)
            .foregroundColor(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
        }
      }
    }
  }
}

struct LazyVStackView_Previews: PreviewProvider {
  static var previews: some View {
    LazyVStackView()
  }
}
