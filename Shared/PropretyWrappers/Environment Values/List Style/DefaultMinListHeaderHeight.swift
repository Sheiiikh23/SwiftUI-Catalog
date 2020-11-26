//
//  DefaultMinListHeaderHeight.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/07/2020.
//

import SwiftUI

/// defaultMinListHeaderHeight indique la height minimum d'une headerList
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// defaultMinListHeaderHeight: CGFloat? { get set } 
///   - nil : par défaut
///

// MARK: - Importance pour l'accessibilité : très faible - faible
// MARK: - Utilisation : Indique la taille du Header d'une List 

struct DefaultMinListHeaderHeight: View {

  @Environment(\.defaultMinListHeaderHeight) var titleHeight

  var body: some View {
    NavigationView {
      List(0 ..< 50) { item in
        Text("Title height is \(titleHeight ?? 99)")
          .font(.title2)
          .fontWeight(.bold)
          .foregroundColor(.black)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Color.red.opacity(0.75))
      }
      .navigationTitle("Hello World")
    }
  }
}

struct DefaultMinListHeaderHeight_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DefaultMinListHeaderHeight()
        .environment(\.defaultMinListHeaderHeight, 2)
      DefaultMinListHeaderHeight()
        .environment(\.defaultMinListHeaderHeight, 10)
      DefaultMinListHeaderHeight()
    }
  }
}
