//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de connaître et de setter la height minimum d'un header d'une Section
///
/// Définition de l'`EnvironmentValue` :
///   - var defaultMinListHeaderHeight: CGFloat? { get set }
///     - nil par défaut. Le système choisit la hauteur appropriée
///
/// Remarque :
///   - Pour modifier la valeur de la height d'un header d'une list on utiliser ` environment(\.defaultMinListHeaderHeight, value)`

struct DefaultMinListHeaderHeight: View {

  @State private var headerHeight: CGFloat = 60

  var body: some View {
    VStack {
      HStack {
        Text("Header height")
        Slider(value: $headerHeight, in: 60...600)
          .tint(.indigo)
      }
      .padding()
      List(1..<5) { section in
        Section("Section \(section)") {
          ForEach(1..<3) { row in
            Text("Current header section height is : " + String(format: "%.2f", headerHeight))
          }
        }
      }
    }
    .environment(\.defaultMinListHeaderHeight, headerHeight)
  }
}

struct DefaultMinListHeaderHeight_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DefaultMinListHeaderHeight()
    }
  }
}
