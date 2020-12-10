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
/// Possibilité de set cet environment variable avec le modifier .environment(\.defaultMinListRowHeight, CGFloat)

// MARK: - Importance pour l'accessibilité : très faible - faible
// MARK: - Utilisation : Permet de connaître et setter la height d'une row d'une List

struct DefaultMinListRowHeight: View {

  @Environment(\.defaultMinListRowHeight) private var rowHeight

  var body: some View {
    List(0 ..< 50) { item in
      Text("Row height is \(rowHeight)")
        .font(.title2)
        .fontWeight(.bold)
        .foregroundColor(.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.75))
    }
  }
}

struct DefaultMinListRowHeight_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DefaultMinListRowHeight()
      DefaultMinListRowHeight()
        .environment(\.defaultMinListRowHeight, 150)
      DefaultMinListRowHeight()
        .environment(\.defaultMinListRowHeight, 1)
    }
  }
}
