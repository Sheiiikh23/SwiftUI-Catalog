//
//  ListWithChildrenView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// Apparition des list avec childrens (sous listes imbriquées)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
/// Le model doit contenir des childrens ––> tableau optionnel du model
/// Choisir le constructeur qui prend des children :
///   • List(data, children: \.childrenProperty) ... 

struct Person: Identifiable {
  var id = UUID()
  var name: String
  var children: [Person]?
}


struct ListWithChildrenView: View {
  var body: some View {
    List(mocks, children: \.children) { person in
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


extension ListWithChildrenView {
  var mocks: [Person] {
    [
      Person(name: "Person 0"),
      Person(name: "Lucas",
             children: [
              Person(name: "Marc",
                     children: [
                      Person(name: "David")
                     ])
             ]),
      Person(name: "Person 1")
    ]

  }
}

