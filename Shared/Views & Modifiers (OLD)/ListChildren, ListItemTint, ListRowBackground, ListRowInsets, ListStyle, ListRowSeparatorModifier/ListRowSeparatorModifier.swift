//
//  ListRowSeparatorModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 10/06/2021.
//

import SwiftUI

#warning("TO DO – SEPARATE")

// Doit être dans un forEach

struct ListRowSeparatorModifier: View {
  var body: some View {
    List {
      ForEach(1..<100) { i in
      Text("Row n°\(i)")
        .listRowSeparator(.hidden) // .visible, .automatic
        .listSectionSeparator(.visible) // aussi pour les sections
      }
    }
  }
}


// Doit également être dans un ForEach
struct ListRowSepartorTintModifier: View {

  var body: some View {
    List {
      ForEach(1..<100) { i in
      Text("Row n°\(i)")
          .listRowSeparatorTint(.red)
          .listSectionSeparatorTint(.red, edges: .bottom)
      }
    }
  }
}

struct ListRowSeparatorModifier_Previews: PreviewProvider {
  static var previews: some View {
    ListRowSeparatorModifier()
  }
}
