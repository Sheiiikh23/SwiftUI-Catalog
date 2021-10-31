//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI
import WidgetKit

/// Plateformes : i•Pad•OS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Permet de connaître la taille d'un widget et d'adapter son layout si nécessaire
///
/// Définition de l'`EnvironmentValue` :
///   - var widgetFamily: WidgetFamily { get }
///     - WidgetFamily :
///       - systemSmall
///       - systemMedium
///       - systemLarge
///       - systemExtraLarge (iPadOS 15.0 only)
///
/// Remarques :
///   - Les widgets peuvent supporter plusieurs tailles, on peut utiliser cet `EnvironmentValue` afin d'adapter le layout
///   - Pour spécifier les tailles supportées par un widget on utilise le modifier `supportedFamilies(_:)`

struct WidgetFamily: View {

  @Environment(\.widgetFamily) private var widgetFamily

  var body: some View {
    switch widgetFamily {
    case .systemSmall:
      Text("Small Widget, available on iOS, iPadOS & MacOS")
    case .systemMedium:
      Text("Medium Widget, available on iOS, iPadOS & MacOS")
    case .systemLarge:
      Text("Large Widget, available on iOS, iPadOS & MacOS")
    case .systemExtraLarge:
      Text("Extra Large Widget, available on iOS, iPadOS & MacOS")
    @unknown default:
      fatalError("Unknown widget size")
    }
  }
}

struct WidgetFamily_Previews: PreviewProvider {
  static var previews: some View {
    WidgetFamily()
  }
}
