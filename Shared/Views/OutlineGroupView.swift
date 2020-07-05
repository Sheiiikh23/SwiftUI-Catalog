//
//  OutlineGroupView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 07/08/2020.
//

import SwiftUI

/// Apparition des OutlineGroup qui permet de créer des DisclosureGroup pour chaque sous arbre de données
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// Permet de créer une Disclosuregroup (DropDown) pour chaque sous Arbre de donnée
/// Très utilisé dans des List notamment
/// ForEach + DisclosureGroup rassemblé en quelque sorte

// MARK: - Utilisation : List imbriqué pour chaque sous-arbre de données

struct OutlineGroupView: View {
  var body: some View {
    List {
      Label("Home", systemImage: "house")
      
      Divider()
      
      OutlineGroup(stubs, children: \.children) {
        Text($0.title)
      }


      Divider()
      
      Section(header: Text("Settings")) {
        Label("Account", systemImage: "person.crop.circle")
        Label("Help", systemImage: "person.3")
        Label("Logout", systemImage: "applelogo")
      }
    }
    .listStyle(SidebarListStyle())
  }
}

struct OutlineGroupView_Previews: PreviewProvider {
  static var previews: some View {
    OutlineGroupView()
  }
}

struct Item: Identifiable {
  var id = UUID()
  var title: String
  var children: [Item]?
}


var stubs: [Item] = [
  Item(title: "Computers", children: [
    Item(title: "Desktops", children: [
      Item(title: "iMac", children: nil),
      Item(title: "Mac Mini", children: nil),
      Item(title: "Mac Pro", children: nil)
    ]),
    Item(title: "Laptops", children: [
      Item(title: "MacBook Pro", children: nil),
      Item(title: "MacBook Air", children: nil),
    ])
  ]),
  Item(title: "Smartphones", children: [
    Item(title: "iPhone 11", children: nil),
    Item(title: "iPhone XR", children: nil),
    Item(title: "iPhone XS Max", children: nil),
    Item(title: "iPhone X", children: nil)
  ]),
  Item(title: "Tablets", children: [
        Item(title: "iPad Pro", children: nil),
        Item(title: "iPad Air", children: nil),
        Item(title: "iPad Mini", children: nil),
        Item(title: "Accessories", children: [
          Item(title: "Magic Keyboard", children: nil),
          Item(title: "Smart Keyboard", children: nil)
        ])]),
  Item(title: "Wearables", children: [
    Item(title: "Apple Watch Series 5", children: nil),
    Item(title: "Apple Watch Series 3", children: nil),
    Item(title: "Bands", children: [
      Item(title: "Sport Band", children: nil),
      Item(title: "Leather Band", children: nil),
      Item(title: "Milanese Band", children: nil)
    ])
  ])
]
