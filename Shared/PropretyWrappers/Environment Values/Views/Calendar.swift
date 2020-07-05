//
//  Calendar.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 09/09/2020.
//

import SwiftUI

/// calendar premet d'accéder aux préférences du calendrier de l'utilisateur
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// calendar: Calendar { get set } 
///

// MARK: - Importance pour l'accessibilité : moyenne
// MARK: Utilisation : Pratique pour des formulaires pour convertir des dates et faire des checks

struct CalendarEnvironment: View {

  @Environment(\.calendar) var calendar

  var body: some View {
    VStack {
      Text("\(calendar.timeZone)")
    }
  }
}

struct Calendar_Previews: PreviewProvider {
  static var previews: some View {
    CalendarEnvironment()
  }
}
