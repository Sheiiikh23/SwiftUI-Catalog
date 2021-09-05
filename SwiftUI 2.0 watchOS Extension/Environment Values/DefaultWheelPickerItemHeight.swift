//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateforme : watchOS 6.0
/// Description : Permet de connaître la hauteur par défaut d'un picker avec le style `wheel`
///
/// Définition de l'`EnvironmentVariable` :
///   - var defaultWheelPickerItemHeight: CGFloat { get set }

struct DefaultWheelPickerItemHeight: View {

  @Environment(\.defaultWheelPickerItemHeight) private var wheelHeight
  @State private var selectedColor = 0

  var body: some View {
    VStack {
      Picker(selection: $selectedColor, label: Text("Pick a color")) {
        Text("RED")
          .tag(1)
        Text("YELLOW")
          .tag(2)
        Text("GREEN")
          .tag(3)
      }
      .pickerStyle(WheelPickerStyle())
    }
    /// Augmentation de la height des rows
    .environment(\.defaultWheelPickerItemHeight, 125)
  }
}

struct DefaultWheelPickerItemHeight_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      DefaultWheelPickerItemHeight()
      DefaultWheelPickerItemHeight()
        .environment(\.defaultWheelPickerItemHeight, 100)
      DefaultWheelPickerItemHeight()
        .environment(\.defaultWheelPickerItemHeight, 250)
    }
  }
}
