//
//  SearchableModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 08/06/2021.
//

import SwiftUI

/// Searchable permet de créer une searchBar
///
/// SearchCompletion s'utilise avec les suggestion de la searchBar
///
/// Doit être wrapper dans une NavigationView
///
/// Faire un vrai exemple avec un @StateObject

#warning("TO DO – Pas mal de paramètre disponible")
#warning("TO DO – FIXME: searchCompletion modifier")

struct SeachableModifierParent: View {

  var body: some View {
    NavigationView {
      NavigationLink("Children", destination: SearchableModifierChildren())
        .navigationTitle("Parent")
    }
  }
}

struct SearchableModifierChildren: View {

  @State private var searchText = ""

  var body: some View {
    Text("Searching for : \(searchText)")
      .navigationTitle("SeachBar")
      .navigationBarTitleDisplayMode(.inline)
      .searchable(text: $searchText)
  }
}

struct SearchableModifier: View {

  @State private var searchText = ""

  var body: some View {
    NavigationView {
      Text("Searching for : \(searchText)")
        .navigationTitle("SeachBar")
    }
    .searchable(text: $searchText)
  }
}

struct SearchableModifier2: View {

  @State private var searchText = ""
  let names = ["Holly", "Rhonda", "Ted"]

  var body: some View {
    NavigationView {
      List {
        ForEach(searchResult, id: \.self) { name in
          NavigationLink(destination: Text(name)) {
            Text(name)
          }
        }
      }
      .navigationTitle("Contacts")
    }
    .searchable(text: $searchText)
  }

  var searchResult: [String] {
    if searchText.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(searchText) }
    }
  }
}

struct SearchableModifierWithSuggestion: View {

  @State private var searchText = ""
  let names = ["Holly", "Rhonda", "Ted"]

  var body: some View {
    NavigationView {
      List {
        ForEach(searchResult, id: \.self) { name in
          NavigationLink(destination: Text(name)) {
            Text(name)
          }
        }
      }
      .navigationTitle("Contacts")
    }
    .searchable(text: $searchText) {
      ForEach(searchResult, id: \.self) { name in
        Text("Are you looking for : \(name)?")
          .searchCompletion(name) // TODO: permet de setter le text automatiquement avec une suggestion et donc de tombé sur le résultat
      }
    }
  }

  var searchResult: [String] {
    if searchText.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(searchText) }
    }
  }
}

#warning("TO DO – FIXME : @Environment isSearching)")
struct SearchableModifierWithSuggestionOverlay: View {

  @State private var searchText = ""
  @Environment(\.isSearching) var isSearching
  let names = ["Holly", "Rhonda", "Ted"]

  var body: some View {
    NavigationView {
      List {
        ForEach(names, id: \.self) { name in
          NavigationLink(destination: Text(name)) { Text(name) }
        }
      }
      .overlay {
        if !searchText.isEmpty/* && isSearching */{ // FIXME:
          List {
            ForEach(names, id: \.self) { name in
              Text("Are you looking for : \(name)?")
            }
          }
        }
      }
      .navigationTitle("Contact")
    }
    .searchable(text: $searchText, placement: .sidebar)
  }
}

struct SearchableSideBarModifier: View {

  var body: some View {
    List {
      ForEach(1...100, id: \.self) { i in
        Text("Side Row n°\(i)")
      }
    }
  }
}

struct SearchableDetailViewModifier: View {

  var body: some View {
    List {
      ForEach(1...100, id: \.self) { i in
        Text("Detail Row n°\(i)")
      }
    }
  }
}

// Par défaut sur iOS et iPadOS, lors d'une SideBar, le textfield se met automatiquement dans la SideBar (il faut donc le passer en binding à la SideBar j'imagine)
struct SearchableSideBarNavigaitonViewModifier: View {

  @State private var query = ""

  var body: some View {
    NavigationView {
      SearchableSideBarModifier()
      SearchableDetailViewModifier()
    }
    .searchable(text: $query)
  }
}

// On peut forcer pour mettre le textfield de la search dans la DetailView en appliquand le modifier uniquement à la DetailView (passer la query en binding à la DetailView j'imagine)
struct SearchableSideBarNavigationViewInDetailViewModifier: View {

  @State private var query = ""

  var body: some View {
    NavigationView {
      SearchableSideBarModifier()
      SearchableDetailViewModifier()
        .searchable(text: $query)
    }
  }
}

struct SearchableModifierWithAsyncResult: View {

  @State private var query = ""
  let names = ["Holly", "Rhonda", "Ted"]

  var body: some View {
    NavigationView {
      List {
        ForEach(searchResult, id: \.self) { name in
          NavigationLink(destination: Text(name)) {
            Text(name)
          }
        }
      }
      .navigationTitle("Contacts")
    }
    .searchable(text: $query) {
      ForEach(searchResult, id: \.self) { name in
        Text("Are you looking for : \(name)?")
          .searchCompletion(name)
      }
    }
    .onSubmit(of: .search) { // Permet de trigger du code lorsque le text press sur enter ou choisit une suggestin
      print("✍️✍️ User did press enter or tap a suggestion x ✍️✍️")
      // Some work here (viewModel, Interactor, whatever...)
    }
  }

  var searchResult: [String] {
    if query.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(query) }
    }
  }
}

struct SearchableModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SearchableModifier()
      SearchableModifier2()
      SearchableModifierWithSuggestion()
    }
  }
}
