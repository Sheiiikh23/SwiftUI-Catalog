//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet d'obtenir la time-zone actuelle que les vues doivent utiliser lors du traitement des dates
///
/// Définition de l'`EnvironmentValue` :
///     - var timeZone: TimeZone { get set }
///
/// Remarque :
///   - Pour plus d'infos sur `TimeZone`, c'est ici : https://developer.apple.com/documentation/foundation/timezone

struct TimeZone: View {

  @Environment(\.timeZone) private var timeZone

  var body: some View {
    VStack {
      Text("TimeZone identifier : \(timeZone.identifier)")
      Text("TimeZone description : \(timeZone.description)")
      Text("\(timeZone.daylightSavingTimeOffset(for: Date()))")
      Text("TimeZone is daylight saving time ? ") + Text((timeZone.isDaylightSavingTime()) ? "True" : "False")
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
