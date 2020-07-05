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
    if case 10 = titleHeight {
      List(0 ..< 5) { item in
        Text("Title height de 10")
          .font(.title2)
          .fontWeight(.bold)
          .foregroundColor(.black)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color.pink.opacity(0.75))
          .clipShape(Capsule())
      }
    } else if case 20 = titleHeight {
      List(0 ..< 5) { item in
        Text("Title height de 20")
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
        Text("Other title height")
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

struct DefaultMinListHeaderHeight_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DefaultMinListHeaderHeight()
        .environment(\.defaultMinListHeaderHeight, 20)
        DefaultMinListHeaderHeight()
          .environment(\.defaultMinListHeaderHeight, 10)
      DefaultMinListHeaderHeight()
    }
  }
}
