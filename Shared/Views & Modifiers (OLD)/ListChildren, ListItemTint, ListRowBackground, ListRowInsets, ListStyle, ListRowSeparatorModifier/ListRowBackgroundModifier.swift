//
//  ListRowBackgroundModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 31/05/2021.
//

import SwiftUI

/// ListRowBackground permet d'ajouter un background custom aux rows d'une List
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Le modifier s'attend à une View on peut donc y placer ce que l'on souhaite (cf ci-dessous)
/// Ce modifier peut s'appliquer pour chaque row (si en dur) ou de manière plus générique grâce à l'utilisation d'un `ForEach` par exemple

// MARK: - Utilisation : Permet d'ajouter une View pour les rows d'une List

struct ListRowBackgroundModifier: View {
  var body: some View {
    List {
      Text("Bananas 🍌🍌")
        .listRowBackground(Color.yellow)
      Text("Apples 🍏🍏")
        .listRowBackground(Color.green)
      Text("Peaches 🍑🍑")
        .listRowBackground(Color.orange)
      Text("No fruits and no background")
    }
  }
}

struct ListRowBackgroundModifierWithForEach: View {

  var fruits = ["Bananas 🍌🍌", "Apples 🍏🍏", "Peaches 🍑🍑"]

  var body: some View {
    List {
      ForEach(fruits, id: \.self) { (fruit: String) in
        Text(fruit)
      }
      .listRowBackground(Color.yellow)
    }
  }
}

struct ListRowBackgroundGenericViewModifierWithForEach: View {

  var body: some View {
    List {
      ForEach(Flavor.allCases) { flavor in
        Text(flavor.rawValue)
          .listRowBackground(
            Image(systemName: "sparkles")
              .foregroundColor(.red.opacity(0.75))
          )
      }
    }
  }
}

struct ListRowBackgroundModifier_Previews: PreviewProvider {
  static var previews: some View {
    ListRowBackgroundModifier()
    ListRowBackgroundModifierWithForEach()
    ListRowBackgroundGenericViewModifierWithForEach()
  }
}

fileprivate enum Flavor: String, CaseIterable, Identifiable {
  case vanilla
  case chocolate
  case strawberry

  var id: String { rawValue }
}
