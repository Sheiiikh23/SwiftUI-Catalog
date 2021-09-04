//
//  LayoutDirection.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/07/2020.
//

import SwiftUI

/// layoutDirection indique la direction du layout (gauche -> droite ou droite -> gache)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// layoutDirection: LayoutDirection { get set } 
///   - leftToRight : par défaut
///   - rightToLeft
/// Possibilité de set cet environment variable avec le modifier .environment(\.layoutDirection, .option)
/// À noter qu'on peut aussi utiliser le modifier flipsForRightToLeftLayoutDirection(Bool)

// MARK: - Importance pour l'accessibilité : faible – moyenne
// MARK: - Utilisation : Permet de connaître le sens de lecture (utile selon les pays) et de le setter si besoin

struct LayoutDirection: View {

  @Environment(\.layoutDirection) private var layoutDirection

  var body: some View {
    ZStack {
      if case .leftToRight = layoutDirection {
        VStack(alignment: .leading) {
          Text("Layout direction is from left to right")
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
          Text("Layout direction is from right to left")
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
      LayoutDirection()
        .environment(\.layoutDirection, .rightToLeft)
    }
  }
}
