//
//  LazyHStackView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 03/07/2020.
//

import SwiftUI

/// Appartion des LazyHStack : HStack où les cellules sont crées uniquement si besoin (comme pour les Grid)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Prend toute la height à sa disposition
/// Même constructeurs que les HStacks avec en plus un PinnedScrollView (cf PinnedScrollView)

#warning("TO DO – Constructeur avec le paramètre PinnedScrollView")

struct LazyHStackView: View {
  var body: some View {
    ScrollView(.horizontal) {
      LazyHStack {
        ForEach(1...1000, id: \.self) { item in
          Text("Cell n°\(item)")
            .font(.title3)
            .foregroundColor(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
        }
      }
    }
  }
}

struct LazyHStackView_Previews: PreviewProvider {
  static var previews: some View {
    LazyHStackView()
  }
}
