//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Booléen qui indique si l'utilisateur est en train d'intérargir avec une search bar
///
/// Définition de l'`EnvironmentValue` :
///   - var isSearching: Bool { get }
///     - true : intéraction en cours avec une search bar
///     - false : aucun intéraction en cours avec une searc bar
///
/// Remarques :
///   - On l'utilisera généralement avec un `overlay(_:)` afin de display une View pendant que le user est dans la search bar
///   - Lien intéressant : https://swiftwithmajid.com/2021/06/23/mastering-search-in-swiftui/

struct IsSearching: View {

  @Environment(\.isSearching) private var isSearching
  @State private var searchText = ""
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
      .navigationTitle("isSearching")
    }
    .searchable(text: $searchText, placement: .sidebar)
  }
}

struct IsSearching_Previews: PreviewProvider {
  static var previews: some View {
    IsSearching()
  }
}
