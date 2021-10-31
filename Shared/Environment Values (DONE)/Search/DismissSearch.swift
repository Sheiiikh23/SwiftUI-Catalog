//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Dismiss l'interaction de recherche en cours dans une search bar
///
/// Définition de l'`EnvironmentValue` :
///   - var dismissSearch: DismissSearchAction { get }
///     - s'utilise via une fonction `callAsFunction()`, qui peut être appelé depuis la propriété
///
/// Remarques :
///   - Efface le champ de recherche et perd le focus de la search bar
///   - En appellant `dismissSearch()` la valeur `isSearching` passe immédiatement à false
///   - S'utilise généralement avec `isSearching` et `overlay(_:)`
///   - Lien intéressant : https://swiftwithmajid.com/2021/06/23/mastering-search-in-swiftui/

struct DismissSearch: View {

  @Environment(\.dismissSearch) private var dismissSearch
  @Environment(\.isSearching) private var isSearching
  @State private var query = ""

  var body: some View {
    NavigationView {
      List(0..<200) { i in
        Text("Row n°\(i)")
      }
      .overlay {
        if isSearching && !query.isEmpty {
          Button {
            dismissSearch()
          } label: {
            Text("Dismiss the search")
              .padding()
              .background(.indigo, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .background(.red)
          }
        }
      }
      .navigationTitle("DismissSearch")
    }
    .searchable(text: $query)
  }
}

struct DismissSearch_Previews: PreviewProvider {
  static var previews: some View {
    DismissSearch()
  }
}
