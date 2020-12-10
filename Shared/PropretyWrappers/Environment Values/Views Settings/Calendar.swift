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
/// Possibilité de set cet environment variable avec le modifier .environment(\.calendar, Calendar)
/// 
/// + d'infos sur le type Calendar ici : https://developer.apple.com/documentation/foundation/calendar
/// Très utile pour le calculs et comparaisons de dates
///
/// On peut accéder au type Locale via le calendar (sinon il y a une @Envionment var):
/// + d'info sur le type Locale : https://developer.apple.com/documentation/foundation/locale

// MARK: - Importance pour l'accessibilité : moyenne
// MARK: - Utilisation : Pratique pour gérer des données avec des dates, heures, données locales etc...

struct CalendarEnvironment: View {

  @Environment(\.calendar) private var calendar
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Quelques exemples d'infos qu'on peut obtenir")
        .font(.headline)
        .fontWeight(.bold)
        .padding(.horizontal, 20)
        .padding(.vertical)
        .background(Color.orange.opacity(0.5))
        .cornerRadius(20)
        .frame(maxWidth: .infinity, alignment: .center)
      Text("Timezone : \(calendar.timeZone)")
      Text("Type of calendar : \(calendar.description)")
      Text("AM & PM symbols : \(calendar.amSymbol) & \(calendar.pmSymbol)")
      /// Infos sur grâce au type Locale 
      if let locale = calendar.locale,
         let languageCode = locale.languageCode,
         let regionCode = locale.regionCode,
         let decimalSeparator = locale.decimalSeparator,
         let groupingSeparator = locale.groupingSeparator,
         let currencyCode = locale.currencyCode,
         let currencySymbol = locale.currencySymbol {
        Text("Locale : \(locale.description)")
        Text("Language code : \(languageCode)")
        Text("Region code : \(regionCode)")
        Text("Decimal separator : \(decimalSeparator)")
        Text("Grouping separator : \(groupingSeparator)")
        Text("Currency code : \(currencyCode)")
        Text("Currency symbol : \(currencySymbol)")
      }
    }
  }
}

struct Calendar_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CalendarEnvironment()
      CalendarEnvironment()
        .environment(\.calendar, Calendar(identifier: .gregorian))
    }
  }
}
