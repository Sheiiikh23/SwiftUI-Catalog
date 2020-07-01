//
//  LazyHGrid.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 01/07/2020.
//

import SwiftUI

/// Apparition des LazyHGrid qui créer des cellules uniquement lorsqu'elles sont requises (similaire à des CollectionView)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Très généralement utilisée dans un ScrollView suivi d'un forEach
/// Son layout est déterminé par un array de GridItem (cf GridItem)


struct LazyHGridWithAdaptiveRowAdaptiveGridItem: View {

  /// Définition du layout
  /// Autant de row que possible d'au minimum 80 points en height
  /// X colonnes (qui s'adaptent en fonction de l'orientation du device)
  let row = [
    GridItem(.adaptive(minimum: 80))
  ]

  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: row, alignment: .center, spacing: 20) {
        ForEach(1...100, id: \.self) { item in
          Text("Item n°\(item)")
        }
      }
    }
  }
}


struct LazyHGridWithOneRowFlexibleGridItem: View {

  /// Définition du layout
  /// Flexible (pas de minimum ni maximum) –> prend toute la height possible
  /// 1 row
  let row = [
    GridItem(.flexible())
  ]

  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: row, alignment: .center, spacing: 20) {
        ForEach(1...100, id: \.self) { item in
          Text("Item n°\(item)")
        }
      }
    }
  }
}


struct LazyHGridWithNRowFlexibleGridItem: View {

  /// Définition du layout
  /// Flexible (pas de minimum ni maximum) –> prend toute la height possible divisé par le nombre de GridItem (ici 3)
  /// 3 row
  let row = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
  ]

  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: row, alignment: .center, spacing: 20) {
        ForEach(1...100, id: \.self) { item in
          Text("Item n°\(item)")
        }
      }
    }
  }
}


struct LazyHGridWithOneRowFixedGridItem: View {

  /// Définition du layout
  /// Fixed ––> prend la height définie
  /// 3 rows de 200 points en height
  let row = [
    GridItem(.fixed(200)),
    GridItem(.fixed(200)),
    GridItem(.fixed(200))
  ]

  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: row, alignment: .center, spacing: 20) {
        ForEach(1...25, id: \.self) { item in
          Text("Item n°\(item)")
        }
      }
    }
  }
}


struct LazyHGridWith2RowsFixedAndFlexibleGridItem: View {

  /// Définition du layout
  /// Fixed ––> prend la height définie
  /// Flexible (pas de minimum ni maximum) ––> prend toute la height possible
  /// 2 rows
  let row = [
    GridItem(.fixed(200)),
    GridItem(.flexible())
  ]

  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: row, alignment: .center, spacing: 20) {
        ForEach(1...100, id: \.self) { item in
          Text("Item n°\(item)")
        }
      }
    }
  }
}


struct LazyHGrid_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LazyHGridWithAdaptiveRowAdaptiveGridItem()
      LazyHGridWithOneRowFlexibleGridItem()
      LazyHGridWithNRowFlexibleGridItem()
      LazyHGridWithOneRowFixedGridItem()
      LazyHGridWith2RowsFixedAndFlexibleGridItem()
    }
  }
}

