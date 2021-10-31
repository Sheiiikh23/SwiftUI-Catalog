//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Une `View` qui affiche des contrôles sémantiquement liés d'une manière visuellement appropriée au contexte.
///
/// 1 init pour un `ControlGroup` :
///   - init(@ViewBuilder content: () -> Content) where Content : View
///
/// Paramètre :
///   - @ViewBuilder content () -> Content ––> un ensemble de `View` (maximum 10 subviews)

/// https://swiftwithmajid.com/2021/10/21/mastering-controlgroup-in-swiftui/

struct ControlGroupSample: View {

  var body: some View {
    NavigationView {
      List(0..<100, id: \.self) { row in
        Text("Row n°\(row)")
      }
      .navigationTitle("ControlGroup sample")
      .toolbar {
        ToolbarItem {
          ControlGroup {
            Button { print("Heart has been touched") } label: { Label("Heart", systemImage: SFSymbol.heart.rawValue) }
            Button { print("Trash has been touched") } label: { Label("Trash", systemImage: SFSymbol.trash.rawValue) }
            Button { print("Gear has been touched") } label: { Label("Gear", systemImage: SFSymbol.gear.rawValue) }
          }
        }
      }
    }
  }
}

struct ControlGroupSample_Previews: PreviewProvider {
  static var previews: some View {
    ControlGroupSample()
  }
}
