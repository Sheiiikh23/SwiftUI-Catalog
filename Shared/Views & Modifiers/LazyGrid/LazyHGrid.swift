//
//  LazyHGrid.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 01/07/2020.
//

import SwiftUI

/// Apparition des LazyHGrid qui créer les cellules à la volée
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
///
/// Les cellules sont créer à la volée. Lorsqu'elles ne sont pas affichées, elle ne font pas parties de la view hierarchy.
/// onAppear & onDissappear bien appellé à chaque fois
/// LazyHGrid place ses cellules horizontalement, les cellules disposées en colonnes.
/// Lorsqu'une colonne est pleine (toutes les lignes utiliées), elle passe à la colonne suivante. Voir : https://swiftui-lab.com/wp-content/uploads/2020/07/layouts.mp4
/// Son layout est déterminé par un array de GridItem (cf GridItem
///
/// Très généralement utilisée dans un ScrollView suivi d'un forEach


// MARK: - Utilisation : Création d'une grille horizontale

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
          Text("Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte.")
            .truncationMode(.tail)
            .background(randomColor())
        }
      }
    }
  }
  private func randomColor() -> Color {
    let colors: [Color] = [.red, .gray, .green, .yellow, .orange, .purple, .blue]
    return colors.randomElement() ?? colors[1]
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
          Text("Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte.")
            .truncationMode(.tail)
            .background(randomColor())
        }
      }
    }
  }
  private func randomColor() -> Color {
    let colors: [Color] = [.red, .gray, .green, .yellow, .orange, .purple, .blue]
    return colors.randomElement() ?? colors[1]
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
          Text("Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte.")
            .truncationMode(.tail)
            .background(randomColor())
        }
      }
    }
  }
  private func randomColor() -> Color {
    let colors: [Color] = [.red, .gray, .green, .yellow, .orange, .purple, .blue]
    return colors.randomElement() ?? colors[1]
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
          Text("Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte.")
            .truncationMode(.tail)
            .background(randomColor())
        }
      }
    }
  }
  private func randomColor() -> Color {
    let colors: [Color] = [.red, .gray, .green, .yellow, .orange, .purple, .blue]
    return colors.randomElement() ?? colors[1]
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
          Text("Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte. Beaucoup de texte.")
            .truncationMode(.tail)
            .background(randomColor())
        }
      }
    }
  }
  private func randomColor() -> Color {
    let colors: [Color] = [.red, .gray, .green, .yellow, .orange, .purple, .blue]
    return colors.randomElement() ?? colors[1]
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

