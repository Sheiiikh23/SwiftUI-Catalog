//
//  ListRowInsetsModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 31/05/2021.
//

import SwiftUI

/// ListRowInsets permet de changer le padding par défaut pour les rows d'une List.
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Le modifier s'applique uniquement pour les rows créer à l'aide d'un `ForEach`

// MARK: - Utilisation : Permet d'appliquer un padding custom pour les rows d'une List

struct ListRowInsetsModifier: View {

  var body: some View {
    List {
      ForEach(Flavor.allCases) { flavor in
        Text(flavor.rawValue)
      }
      .listRowInsets(.init(top: 50, leading: 50, bottom: 50, trailing: 0))
    }
  }
}

struct ListRowInsetsModifier_Previews: PreviewProvider {
  static var previews: some View {
    ListRowInsetsModifier()
  }
}

fileprivate enum Flavor: String, CaseIterable, Identifiable {
  var id: String { self.rawValue }
  case vanilla
  case chocolate
  case strawberry
}
