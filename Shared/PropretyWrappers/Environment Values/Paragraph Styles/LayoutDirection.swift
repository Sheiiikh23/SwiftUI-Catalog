//
//  LayoutDirection.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/07/2020.
//

import SwiftUI

/// layoutDirection indique la direction du layout
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// layoutDirection: LayoutDirection { get set } 
///   - leftToRight : par défaut
///   - rightToLeft
///

// MARK: - Importance pour l'accessibilité : très faible - faible
// MARK: - Utilisation : Pas trop besoin car déjà natif avec les localizedStrings

struct LayoutDirection: View {

  @Environment(\.layoutDirection) var layoutDirection

  var body: some View {
    ZStack {
      if case .leftToRight = layoutDirection {
        VStack(alignment: .leading) {
          Text("We're reading from left to right")
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Color.pink.opacity(0.5))
            .clipShape(Capsule())

          Text("Some stuff here")
        }
      } else {
        VStack(alignment: .leading) {
          Text("We're reading from right to left")
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Color.green.opacity(0.5))
            .clipShape(Capsule())
          Text("Some stuff here")
        }
      }
    }
  }
}

struct LayoutDirection_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LayoutDirection()
        // Par défaut
        .environment(\.layoutDirection, .leftToRight)
      LayoutDirection()
        .environment(\.layoutDirection, .rightToLeft)
    }
  }
}
