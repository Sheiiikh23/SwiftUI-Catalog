//
//  PickerStyleModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 29/08/2020.
//

import SwiftUI

/// Modifier propre pour les Picker :
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// PickerStyle présents nativement:
///  • DefaultPickerStyle : dépend du context
///     - i•Pad•OS / watchOS : wheel
///     - macOS : menu
///     - tvOS : segmented
///  • InlinePickerStyle : chaque option est affiché en ligne avec les autres vues du contenaire
///  • MenuPickerStyle : i•Pad•OS / macOS / Mac Catalyst
///     - bouton qui présente les options via un Menu
///  • RadioGroupPickerStyle : macOS
///     - les options sont représentées par des boutons radios
///  • SegmentedPickerStyle : i•Pad•OS / tvOS / macOS / Mac Catalyt
///     - les options sont représentés au sein d'un contrôle segmenté
///  • WheelPickerStyle : i•Pad•OS / watchOS / Mac Catalyst
///     - les options sont représentés au sein d'une wheel, et montre quelques options voisines

// MARK: - Utilisation : Custom la UI d'une Toggle View

struct PickerStyleModifier: View {

  @State private var selection = "France"
  private var countries = ["France", "Belgique", "Suisse", "Italie", "Espagne"]

  var body: some View {
    NavigationView {
      Form {

        /// DefaultPickerStyle doit être contenu dans une NavigationView et Form
        /// Permet de faire basculer l'utilisateur vers un nouvel écran
        VStack(spacing: 50) {
          Picker("Choisis un pays", selection: $selection) {
            ForEach(countries, id: \.self) { country in
              Text(country)
                .tag(country)
            }
          }
          .pickerStyle(DefaultPickerStyle())

          /// InlinePickerStyle
          VStack {
            Text("Choisis un pays mon reuf")
            Picker("Choisis un pays", selection: $selection) {
              ForEach(countries, id: \.self) { country in
                Text(country)
                  .tag(country)
              }
            }
            .pickerStyle(InlinePickerStyle())
          }

          /// MenuPickerStyle
          Picker("Choisis un pays", selection: $selection) {
            ForEach(countries, id: \.self) { country in
              Text(country)
                .tag(country)
            }
          }
          .pickerStyle(MenuPickerStyle())

          #if os(macOS)
          /// RadioGroupPickerStyle
          Picker("Choisis un pays", selection: $selection) {
            ForEach(countries, id: \.self) { country in
              Text(country)
                .tag(country)
            }
          }
          .pickerStyle(RadioGroupPickerStyle())
          #endif

          /// SegmentedPickerStyle
          Picker("Choisis un pays", selection: $selection) {
            ForEach(countries, id: \.self) { country in
              Text(country)
                .tag(country)
            }
          }
          .pickerStyle(SegmentedPickerStyle())

          /// WheelPickerStyle
          Picker("Choisis un pays", selection: $selection) {
            ForEach(countries, id: \.self) { country in
              Text(country)
                .tag(country)
            }
          }
          .pickerStyle(WheelPickerStyle())
        }
      }
    }
  }
}

struct PickerStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      PickerStyleModifier()
        .preferredColorScheme(.dark)
    }
  }
}
