//
//  RefreshableModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 08/06/2021.
//

import SwiftUI

/// Refrashable permet de créer un pull to refresh qui appelle une fonction asynchrone (async / await propre à Swift 5.5), avec un loader
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Affiche un loader le temps du chargement (pas possible de modifier cette vue)
/// S'utilise principalement avec des View qui scroll verticalement comme une list par exemple

// MARK: - Utilisation : créer un pull-to-refresh qui appelle une fonction asynchrone

struct RefreshableModifier: View {

  var body: some View {
    NavigationView {
      List(0..<100, id: \.self) { i in
        Text("Row n°\(i)")
      }
      .refreshable {
        print("Execute an async function here")
      }
    }
  }
}

struct RefreshableModifier_Previews: PreviewProvider {
  static var previews: some View {
    RefreshableModifier()
  }
}
