//
//  BindingCollections.swift
//  iOS
//
//  Created by Lucas Abijmil on 11/06/2021.
//

import SwiftUI

/// Désormais un `ForEach` et `List` permet de créer des bindings pour chaque item d'une `Collection`
///
///
/// Askip dispo dès iOS 13 grâce à Swift

#warning("TODO")
// Faire un exemple avec un @StateObject

struct Direction: Identifiable {
  let id = UUID()
  var name: String
  let letter: String
}

struct BindingCollectionsWithList: View {

  @State private var directions = [
    Direction(name: "Direction", letter: "N"),
    Direction(name: "Direction", letter: "N"),
    Direction(name: "Direction", letter: "N"),
    Direction(name: "Direction", letter: "N")
  ]

  var body: some View {
    List($directions) { $direction in
      TextField("Direction", text: $direction.name)
        .submitLabel(.continue)
      Text("Letter : \(direction.letter)")
    }
  }
}

struct BindingCollectionsWithForEach: View {

  @State private var directions = [
    Direction(name: "Direction", letter: "N"),
    Direction(name: "Direction", letter: "N"),
    Direction(name: "Direction", letter: "N"),
    Direction(name: "Direction", letter: "N")
  ]

  var body: some View {
    List {
      ForEach($directions) { $direction in
        TextField("Direction", text: $direction.name)
          .submitLabel(.continue)
        Text("Letter : \(direction.letter)")
      }
    }
  }
}

struct BindingCollections_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      BindingCollectionsWithList()
      BindingCollectionsWithForEach()
    }
  }
}
