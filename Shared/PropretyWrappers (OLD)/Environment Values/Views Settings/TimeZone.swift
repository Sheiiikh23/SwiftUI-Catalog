//
//  TimeZine.swift
//  iOS
//
//  Created by Lucas Abijmil on 30/11/2020.
//

import SwiftUI

/// timeZone permet d'accéder au fuseau horaire actuel notamment pour les traitement de données
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// timeZone: TimeZone { get set }
/// Possibilité de set cet environment variable avec le modifier .environment(\.timeZone, TimeZone)
///
/// Conventions de temps relatif par rapport à la région
/// Pas mal de fonction disponible avec le type 👍
///
/// + d'info sur le type TimeZone ici : https://developer.apple.com/documentation/foundation/timezone

// MARK: - Importance pour l'accessibilité : moyenne – élevée
// MARK: - Utilisation : Permet de formatter les données en fonctions des langues (préférable d'utiliser des LocalizedStrings)

struct TimeZone: View {

  @Environment(\.timeZone) private var timeZone

  var body: some View {
    VStack {
      Text("Quelques exemples d'infos qu'on peut obtenir")
        .font(.headline)
        .fontWeight(.bold)
        .padding(.horizontal, 20)
        .padding(.vertical)
        .background(Color.orange.opacity(0.5))
        .cornerRadius(20)
      Text("TimeZone identifier : \(timeZone.identifier)")
      Text("TimeZone description : \(timeZone.description)")
      Text("\(timeZone.daylightSavingTimeOffset(for: Date()))")
      Text((timeZone.isDaylightSavingTime()) ? "True" : "False")
    }
  }
}

struct TimeZine_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TimeZone()
      TimeZone()
        .environment(\.timeZone, SwiftUI.TimeZone(abbreviation: "PST")!)
    }
  }
}
