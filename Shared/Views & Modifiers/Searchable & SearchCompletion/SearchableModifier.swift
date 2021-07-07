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
          .searchCompletion(name)
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

struct SearchableModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SearchableModifier()
      SearchableModifier2()
      SearchableModifierWithSuggestion()
    }
  }
}
