//
//  ColoredSFSymbolsView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Plein de nouveau SF Symbols présent nativement.
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
/// Désormais certain SFSymbols sont colorés de manière automatique par Apple
/// Il faut préciser à SwiftUI qu'on veut appliqué la couleur par défaut donné par Apple
/// Utilisation du modifier : renderingMode(.original)

struct ColoredSFSymbolsView: View {
  var body: some View {
    VStack(spacing: 50) {

      Image(systemName: "drop.triangle.fill")
        /// renderingMode avant tout autre modifier sinon erreur de compilation
        .renderingMode(.original)
        .font(.title)
        .scaleEffect(1.5)
    }
  }
}

struct ColoredSFSymbolsView_Previews: PreviewProvider {
  static var previews: some View {
    ColoredSFSymbolsView()
      .preferredColorScheme(.dark)
  }
}
