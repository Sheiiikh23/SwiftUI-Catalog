//
//  LazyVGridView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 29/06/2020.
//

import SwiftUI

/// Apparition des LazyVGrid qui créer des cellules uniquement lorsqu'elles sont requises
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Très généralement utilisée dans un ScrollView suivi d'un forEach
/// Son layout est déterminé par un array de GridItem (cf GridItem)


struct LazyVGridWithAdpativeColumnsAdaptiveGridItemView: View {

  /// Définition du layout
  /// Autant de colonne que possible d'au minimum 80 points en width
  /// X colonnes (qui s'adaptent en fonction de l'orientation du device)
  let columns = [
    GridItem(.adaptive(minimum: 80))
  ]

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(1...100, id: \.self) { item in
          Text("Item n°\(item)")
        }
      }
      .padding(.horizontal)
    }
  }
}


struct LazyVGridWithOneColumsFlexibleGridItemView: View {

  /// Définition du layout
  /// Flexible (pas de minimum ni maximum) ––> prend toute la width possible
  /// 1 colonne
  let columns = [
    GridItem(.flexible())
  ]

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(1...100, id: \.self) { item in
          Text("Item n°\(item)")
        }
      }
      .padding(.horizontal)
    }
  }
}


struct LazyVGridWithNColumnsFlexibleGridItemView: View {

  /// Définition du layout
  /// Flexible (pas de minimum ni maximum) ––> prend toute la width possible divisé par le nombre de GridItem (ici 3)
  /// S'adapte PAS en fonction de l'orientation du iDevice
  /// 3 colonnes
  let columns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
  ]

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(1...100, id: \.self) { item in
          Text("Item n°\(item)")
        }
      }
      .padding(.horizontal)
    }
  }
}


struct LazyVGridWithFixedGridItemView: View {

  /// Définition du layout
  /// Fixed ––> prend la width définie
  /// 3 colonnes de 100 points en width
  let columns = [
    GridItem(.fixed(100)),
    GridItem(.fixed(100)),
    GridItem(.fixed(100))
  ]

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(1...100, id: \.self) { item in
          Text("Item n°\(item)")
        }
      }
      .padding(.horizontal)
    }
  }
}


struct LazyVGridWith2ColumnsFixedAndFlexibleGridItemView: View {

  /// Définition du layout
  /// Fixed ––> prend la width définie
  /// Flexible (pas de minimum ni maximum) ––> prend toute la width possible
  /// 2 colonnes
  let columns = [
    GridItem(.fixed(100)),
    GridItem(.flexible())
  ]
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(1...100, id: \.self) { item in
          Text("Item n°\(item)")
        }
      }
      .padding(.horizontal)
    }
  }
}


struct LazyVGridView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LazyVGridWithAdpativeColumnsAdaptiveGridItemView()
      LazyVGridWithOneColumsFlexibleGridItemView()
      LazyVGridWithNColumnsFlexibleGridItemView()
      LazyVGridWithFixedGridItemView()
      LazyVGridWith2ColumnsFixedAndFlexibleGridItemView()
    }
  }
}
