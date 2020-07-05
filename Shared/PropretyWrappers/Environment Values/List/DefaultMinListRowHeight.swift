//
//  DefaultMinListRowHeight.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 25/07/2020.
//

import SwiftUI

/// defaultMinListRowHeight indique la height minimum d'une row d'une List
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// defaultMinListRowHeight: CGFloat { get set }
///

// MARK: - Importance pour l'accessibilité : très faible - faible
// MARK: - Utilisation : Indique la height minimal d'une row d'une List

struct DefaultMinListRowHeight: View {

  @Environment(\.defaultMinListRowHeight) var rowHeight

  var body: some View {
    if case 10 = rowHeight {
      List(0 ..< 5) { item in
        Text("Row height de 10")
          .font(.title2)
          .fontWeight(.bold)
          .foregroundColor(.black)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color.pink.opacity(0.75))
          .clipShape(Capsule())
      }
    } else if case 20 = rowHeight {
      List(0 ..< 5) { item in
        Text("Row height de 20")
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(.white)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color.green.opacity(0.75))
          .clipShape(Capsule())
      }
    } else {
      List(0 ..< 5) { item in
        Text("Other row height")
          .font(.title2)
          .fontWeight(.bold)
          .foregroundColor(.black)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color.red.opacity(0.75))
          .clipShape(Capsule())
      }
    }
  }
}

struct DefaultMinListRowHeight_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DefaultMinListRowHeight()
        .environment(\.defaultMinListRowHeight, 20)
      DefaultMinListRowHeight()
        .environment(\.defaultMinListRowHeight, 10)
      DefaultMinListRowHeight()
    }
  }
}
