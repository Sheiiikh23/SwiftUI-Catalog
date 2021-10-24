//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : La visibilité de l'indicateur de menu à appliquer aux contrôles dans la `View`
///
/// Définition de l'`EnvironmentValue` :
///   - var menuIndicatorVisibility: Visibility { get set }
///       - automatic : par défaut
///       - visible
///       - hidden
///
/// Remarque :
///   - On retrouve cette notion de `Visibility` notamment avec les modifiers `listRowSeparator(_:)` & `menuindicator(_:)`

struct MenuIndicatorVisibility: View {

  @Environment(\.menuIndicatorVisibility) var menuIndicatorVisibility

  var body: some View {
    VStack {
      Text("Menu indicator visibility : \(menuIndicatorVisibility.description)")
      List {
        ForEach(0...250, id: \.self) { i in
          Text("Element : \(i)")
        }
        .listRowSeparator(menuIndicatorVisibility)
      }
    }
  }
}

struct MenuIndicatorVisibility_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      MenuIndicatorVisibility()
      MenuIndicatorVisibility()
        .environment(\.menuIndicatorVisibility, .visible)
      MenuIndicatorVisibility()
        .environment(\.menuIndicatorVisibility, .hidden)
    }
    .preferredColorScheme(.dark)
  }
}
