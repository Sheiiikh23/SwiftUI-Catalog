//
//  ColoredSFSymbolsView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// SF Symbols en couleur + nouveaux SF Symbols (version 2)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
/// 
/// Utilisation du modifier : renderingMode(.original) pour appliquer les couleurs choisis par Apple

// MARK: - Utilisation : SF Symbols colorés natifs

struct ColoredSFSymbolsView: View {
  var body: some View {
    VStack(spacing: 50) {
      
      Image(systemName: "drop.triangle.fill")
        .renderingMode(.original)
        .font(.system(size: 40, weight: .bold))
        .padding()
        .background(Color.black)
        .clipShape(Circle())

      Image(systemName: "trash.circle.fill")
        .renderingMode(.original)
        .font(.system(size: 35, weight: .black))
        .imageScale(.large)
        .padding()
        .background(Color.black)
        .clipShape(Circle())

      Image(systemName: "cloud.sun.bolt.fill")
        .renderingMode(.original)
        .font(.system(size: 60, weight: .bold))
        .padding()
        .background(Color.black)
        .clipShape(Circle())
    }
  }
}

struct ColoredSFSymbolsView_Previews: PreviewProvider {
  static var previews: some View {
    ColoredSFSymbolsView()
  }
}
