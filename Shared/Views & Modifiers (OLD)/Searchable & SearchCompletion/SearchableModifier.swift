//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Permet de rendre une `View` comme searchable, configurant l'affichage d'une searchBar
///
/// 6 signatures :
///    - func searchable(text: Binding<String>, placement: SearchFieldPlacement = .automatic, prompt: Text? = nil) -> some View
///    - func searchable(text: Binding<String>, placement: SearchFieldPlacement = .automatic, prompt: LocalizedStringKey) -> some View
///    - func searchable<S>(text: Binding<String>, placement: SearchFieldPlacement = .automatic, prompt: S) -> some View where S : StringProtocol
///    - func searchable<S>(text: Binding<String>, placement: SearchFieldPlacement = .automatic, prompt: Text? = nil, @ViewBuilder suggestions: () -> S) -> some View where S : View
///    - func searchable<S>(text: Binding<String>, placement: SearchFieldPlacement = .automatic, prompt: LocalizedStringKey, @ViewBuilder suggestions: () -> S) -> some View where S : View
///    - func searchable<V, S>(text: Binding<String>, placement: SearchFieldPlacement = .automatic, prompt: S, @ViewBuilder suggestions: () -> V) -> some View where V : View, S : StringProtocol
///
/// Paramètres :
///   - text: Binding<String> ––> Le texte affiché et bindé à la searchBar
///   - placement: SearchFieldPlacement = .automatic ––> le placement de la searchBar au sein de la `View`. Il peut être ignoré dans certains cas par SwiftUI
///       - automatic ––> la searchBar est placée automatiquement en fonction du context
///           • i•Pad•OS & macOS : la searchBar est dans la toolbar
///           • tvOS & watchOS : la searchBar est placée en ligne avec le contenu
///       - toolbar ––> la searchBar est placée dans la toolbar
///           • iOS & watchOS : la searchBar est placée sous la barre de navigation et est révélée par un scroll
///           • iPadOS : la searchBar est placée dans la navigationBar en alignment trailing
///           • macOS : la searchBar est placée dans la toolbar en alignment trailing
///           • tvOS : unavailable
///       - sidebar ––> la searchBar est placée dans la sidebar d'une `NavigationView`
///           • i•Pad•OS : la searchBar est placée dans la section dans la sideBar
///           • macOS : la searchBar est alignée avec le content de la sidebar. S'il n'y a pas de sidebar available, alors la searchBar s'aligne avec un autre contenu
///           • tvOS & watchOS : unavailable
///       - navigationBarDrawer ––> la searchBar est placée dans un "tirroir" de la la navigationBar
///           • iOS, watchOS & Mac Catalyst : affiche la searchbar en fonction de la position du scroll de manière automatique
///           • tvOS & macOS : unavailable
///       - navigationBarDrawer(displayMode: SearchFieldPlacement.NavigationBarDrawerDisplayMode) ––> la searchBar est placée dans un "tirroir" de la la navigationBar
///           • iOS
///           • watchOS, tvOS, macOS, Mac Catalyst : unavailable
///               - always : affiche toujours la searchbar peut importe la position du scroll
///               - automatic : affiche la searchbar en fonction de la position du scroll de manière automatique
///   - prompt: Text? = nil ––> placeholder si le `text` est empty
///
/// Remarques :
///   - Doit être appliqué sur une `NavigationView`
///   - `searchCompletion(_:) permet d'autocompléter la search lorsqu'on affiche des suggestions
///   - Utilisation de `@Environment(\.isSearching)` qui permet de savoir si l'utilsateur est en train de taper dans la search bar
///   - Utilisation de `@Environment(\.dissmissSearch)` permet de dissmiss la recherche actuelle
///   - Lorsque l'utilisateur est en train de rechercher, une possibilité est de lui afficher la liste via un overlay (voir `SearchableModifierWithAutomaticPlacementAndSuggestionOverlay`)
///   - On peut utiliser le modifier `onSubmit(of: .search)` qui permet de trigger du code dès que l'utilsateur presse entrée ou choisit une suggestion (voir `SearchableModifierWithOnCommitModifier`)
///   - Lorsque dans la stack de navigation la searchBar n'est pas attaché à la "ParentView" alors la searchBar est toujours visible (voir `SeachableModifierParent`)
///
/// Ressource : https://swiftwithmajid.com/2021/06/23/mastering-search-in-swiftui/

struct SearchableModifierAutomaticPlacement: View {

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
      .navigationTitle("Placement: .automatic, prompt: nil")
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

struct SearchableInlineModifierAutomaticPlacement: View {

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
      .navigationTitle("Placement: .automatic, prompt: nil")
      .navigationBarTitleDisplayMode(.inline)
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

struct SearchableModifierToolbarPlacement: View {

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
      .navigationTitle("Placement: .toolbar, prompt: nil")
    }
    .searchable(text: $searchText, placement: .toolbar)
  }

  var searchResult: [String] {
    if searchText.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(searchText) }
    }
  }
}

struct SearchableInlineModifierToolbarPlacement: View {

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
      .navigationTitle("Placement: .toolbar, prompt: nil")
      .navigationBarTitleDisplayMode(.inline)
    }
    .searchable(text: $searchText, placement: .toolbar)
  }

  var searchResult: [String] {
    if searchText.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(searchText) }
    }
  }
}

struct SearchableModifierSidebarPlacement: View {

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
      .navigationTitle("Placement: .sidebar, prompt: nil")
    }
    .searchable(text: $searchText, placement: .sidebar)
  }

  var searchResult: [String] {
    if searchText.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(searchText) }
    }
  }
}

struct SearchableInlineModifierSidebarPlacement: View {

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
      .navigationTitle("Placement: .sidebar, prompt: nil")
      .navigationBarTitleDisplayMode(.inline)
    }
    .searchable(text: $searchText, placement: .sidebar)
  }

  var searchResult: [String] {
    if searchText.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(searchText) }
    }
  }
}

struct SearchableModifierNavigationBarDrawerPlacement: View {

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
      .navigationTitle("Placement: .navigationBarDrawer, prompt: nil")
    }
    .searchable(text: $searchText, placement: .navigationBarDrawer)
  }

  var searchResult: [String] {
    if searchText.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(searchText) }
    }
  }
}

struct SearchableInlineModifierNavigationBarDrawerPlacement: View {

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
      .navigationTitle("Placement: .navigationBarDrawer, prompt: nil")
      .navigationBarTitleDisplayMode(.inline)
    }
    .searchable(text: $searchText, placement: .navigationBarDrawer)
  }

  var searchResult: [String] {
    if searchText.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(searchText) }
    }
  }
}

struct SearchableModifierNavigationBarDrawerAlwaysPlacement: View {

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
      .navigationTitle("Placement: .navigationBarDrawer(displayMode: .always), prompt: nil")
      .navigationBarTitleDisplayMode(.inline)
    }
    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
  }

  var searchResult: [String] {
    if searchText.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(searchText) }
    }
  }
}

struct SearchableInlineModifierNavigationBarDrawerAlwaysPlacement: View {

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
      .navigationTitle("Placement: .navigationBarDrawer(displayMode: .always), prompt: nil")
      .navigationBarTitleDisplayMode(.inline)
    }
    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
  }

  var searchResult: [String] {
    if searchText.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(searchText) }
    }
  }
}

struct SearchableModifierNavigationBarDrawerAutomaticPlacement: View {

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
      .navigationTitle("Placement: .navigationBarDrawer(displayMode: .automatic), prompt: nil")
      .navigationBarTitleDisplayMode(.inline)
    }
    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic))
  }

  var searchResult: [String] {
    if searchText.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(searchText) }
    }
  }
}

struct SearchableInlineModifierNavigationBarDrawerAutomaticPlacement: View {

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
      .navigationTitle("Placement: .navigationBarDrawer(displayMode: .automatic), prompt: nil")
      .navigationBarTitleDisplayMode(.inline)
    }
    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic))
  }

  var searchResult: [String] {
    if searchText.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(searchText) }
    }
  }
}

struct SearchableModifierWithPrompt: View {

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
      .navigationTitle("Placement: .automatic, prompt: \"Search for someone\"")
    }
    .searchable(text: $searchText, prompt: "Search for someone")
  }

  var searchResult: [String] {
    if searchText.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(searchText) }
    }
  }
}

struct SearchableInlineModifierWithPrompt: View {

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
      .navigationTitle("Placement: .automatic, prompt: \"Search for someone\"")
      .navigationBarTitleDisplayMode(.inline)
    }
    .searchable(text: $searchText, prompt: "Search for someone")
  }

  var searchResult: [String] {
    if searchText.isEmpty {
      return names
    } else {
      return names.filter { $0.contains(searchText) }
    }
  }
}

struct SearchableModifierWithSuggestions: View {

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
      .navigationTitle("Placement: .automatic, prompt: \"Search for someone\"")
    }
    .searchable(text: $searchText, prompt: "Search for someone") {
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

struct SearchableInlineModifierWithSuggestions: View {

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
      .navigationTitle("Placement: .automatic, prompt: \"Search for someone\"")
      .navigationBarTitleDisplayMode(.inline)
    }
    .searchable(text: $searchText, prompt: "Search for someone") {
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
        if !searchText.isEmpty && isSearching {
          List {
            ForEach(names, id: \.self) { name in
              Text("Are you looking for : \(name)?")
            }
          }
        }
      }
      .navigationTitle("Placement: .automatic, prompt: nil")
    }
    .searchable(text: $searchText, placement: .sidebar)
  }
}

struct SearchableModifierWithOnCommitModifier: View {

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
    .onSubmit(of: .search) {
      print("✍️✍️ User did press enter or tap a suggestion x ✍️✍️")
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

struct SearchableModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SearchableModifierAutomaticPlacement()
      SearchableInlineModifierAutomaticPlacement()
      SearchableModifierToolbarPlacement()
      SearchableInlineModifierToolbarPlacement()
      SearchableModifierSidebarPlacement()
      SearchableInlineModifierSidebarPlacement()
      SearchableModifierNavigationBarDrawerPlacement()
      SearchableInlineModifierNavigationBarDrawerPlacement()
      SearchableModifierNavigationBarDrawerAlwaysPlacement()
    }
    Group {
      SearchableInlineModifierNavigationBarDrawerAlwaysPlacement()
      SearchableModifierNavigationBarDrawerAutomaticPlacement()
      SearchableInlineModifierNavigationBarDrawerAutomaticPlacement()
      SearchableModifierWithPrompt()
      SearchableInlineModifierWithPrompt()
      SearchableModifierWithSuggestions()
      SearchableInlineModifierWithSuggestions()
      SearchableModifierWithSuggestionOverlay()
      SearchableModifierWithOnCommitModifier()
      SeachableModifierParent()
    }
  }
}
