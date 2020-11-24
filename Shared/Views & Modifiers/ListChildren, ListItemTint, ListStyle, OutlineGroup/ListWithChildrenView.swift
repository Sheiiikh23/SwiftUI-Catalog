//
//  ListWithChildrenView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// List avec childrens (sous listes imbriquées)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Permet de créer des listes imbriquées
/// Le model doit contenir des childrens qui sont du même type que le model lui-même

// MARK: - Utilisation : Créer des listes imbriquées, resemble un peu au DisclosureGroup

struct ListWithChildrenView: View {
  var body: some View {
    List(Person.mocks, children: \.children) { person in
      Text(person.name)
        .font(.title3)
        .fontWeight(.bold)
    }
    .listStyle(InsetGroupedListStyle())
  }
}

struct ListWithChildrenView_Previews: PreviewProvider {
  static var previews: some View {
    ListWithChildrenView()
  }
}


struct Person: Identifiable {
  var id = UUID()
  var name: String
  var children: [Person]?
}

extension Person {
  static var mocks: [Person] {
    [
      Person(name: "Person 0"),
      Person(name: "Lucas",
             children: [
              Person(name: "Marc",
                     children: [
                      Person(name: "David")
                     ])
             ]),
      Person(name: "Person 1",
             children: [Person(name: "Person 2")])
    ]
  }
}
