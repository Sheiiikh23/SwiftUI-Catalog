//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de connaître et de setter la height minimum d'un row de List
///
/// Définition de l'`EnvironmentValue` :
///   - var defaultMinListRowHeight: CGFloat { get set }
///
/// Remarque :
///   - Pour modifier la valeur de la height d'un header d'une list on utiliser ` environment(\.defaultMinListRowHeight, value)`

struct DefaultMinListRowHeight: View {

  @State private var rowHeight: CGFloat = 30

  var body: some View {
    VStack {
      HStack {
        Text("Row height")
        Slider(value: $rowHeight, in: 30...200)
          .tint(.indigo)
      }
      .padding()
      List(1..<5) { section in
        Section("Section \(section)") {
          ForEach(1..<3) { row in
            Text("Current row height is : " + String(format: "%.2f", rowHeight))
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .background(randomColor())
          }
        }
      }
    }
    .environment(\.defaultMinListRowHeight, rowHeight)
  }
}

struct DefaultMinListRowHeight_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DefaultMinListRowHeight()
      DefaultMinListRowHeight()
        .environment(\.defaultMinListRowHeight, 80)
      DefaultMinListRowHeight()
        .environment(\.defaultMinListRowHeight, 150)
    }
  }
}
