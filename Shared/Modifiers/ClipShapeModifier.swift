//
//  ClipShapeModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Apparition d'une nouvelle TransformedShape qui est la seule disponible pour le clipShape
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
///   • ContainerRelativeShape: prend la même shape que celle du parent container (si pas de shape alors rectangle par défaut)

// MARK: - Utilisation : Pour prendre le même radius que le Parent Container. Très bien pour faire le même radius que celui sur les widgets

struct ClipShapeModifier: View {
  var body: some View {
    VStack {
      Image("diamond")
        .resizable()
        .frame(width: 300, height: 300)
        .aspectRatio(contentMode: .fit)
        .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
        .clipShape(ContainerRelativeShape())
        .padding()
    }
    .padding(20)
    .background(Color.black)
    .cornerRadius(25)
  }
}

struct ClipShapeModifier_Previews: PreviewProvider {
  static var previews: some View {
    ClipShapeModifier()
  }
}
