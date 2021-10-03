//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de récupérer le calendrier actuel que les vues doivent utiliser pour les dates (calcul, comparaison...)
///
/// Définition de l'`EnvironmentValue` :
///   - var calendar: Calendar { get set }
///
/// Remarques :
///   - Pour plus d'infos sur `Calendar`, c'est ici : https://developer.apple.com/documentation/foundation/calendar
///   - Tous les identifiers de `Calendar` sont disponibles, ici : https://developer.apple.com/documentation/foundation/calendar/identifier

struct Calendar: View {

  @Environment(\.calendar) private var calendar
  
  var body: some View {
    VStack(spacing: 20) {
      Text("Current Calendar : \(SwiftUI.Calendar.current)")
      Text("First weekday : \(calendar.firstWeekday)")
      Text("Minimum days in first week : \(calendar.minimumDaysInFirstWeek)")
      Text("Time Zone : \(calendar.timeZone)")
      Text("Am symbol : \(calendar.amSymbol)")
      Text("Pm symbol : \(calendar.pmSymbol)")
      VStack {
        Text("Short weekday symbols")
          HStack {
            ForEach(calendar.shortWeekdaySymbols, id: \.self) { Text($0) }
        }
      }
      VStack {
        Text("Short month symbols")
        ScrollView(.horizontal, showsIndicators: false) {
          HStack {
            ForEach(calendar.shortMonthSymbols, id: \.self) { Text($0) }
          }
        }
      }
    }
  }
}

struct Calendar_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Calendar()
      Calendar()
        .environment(\.calendar, SwiftUI.Calendar(identifier: .gregorian))
      Calendar()
        .environment(\.calendar, SwiftUI.Calendar(identifier: .hebrew))
      Calendar()
        .environment(\.calendar, SwiftUI.Calendar(identifier: .chinese))
      Calendar()
        .environment(\.calendar, SwiftUI.Calendar(identifier: .japanese))
    }
  }
}
