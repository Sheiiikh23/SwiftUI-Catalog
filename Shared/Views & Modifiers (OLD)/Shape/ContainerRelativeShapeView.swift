//
//  ClipShapeModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// ContainerRelativeShape qui est une nouvelle Shape qui reproduit la shape (radius inclus) du container parent
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Si le container parent n'a pas de shape ni de radius alors la shape sera un rectangle par défaut
/// Très utilie notamment pour le modifier : .clipShape

// MARK: - Utilisation : Même shape / radius que le parent container – Très cool pour les Widgets

struct ContainerRelativeShapeView: View {
  var body: some View {
    VStack {
      Image("diamond")
        .resizable()
        .frame(width: 150, height: 150)
        .aspectRatio(contentMode: .fit)
        .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
        .clipShape(ContainerRelativeShape())

    }
    .padding(20)
    .background(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
    .cornerRadius(25)
  }
}

struct ClipShapeModifier_Previews: PreviewProvider {
  static var previews: some View {
    ContainerRelativeShapeView()
  }
}
