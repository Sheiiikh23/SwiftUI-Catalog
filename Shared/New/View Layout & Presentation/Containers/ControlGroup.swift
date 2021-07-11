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

struct ControlGroupView: View {

  var body: some View {
    NavigationView {
      List(0..<100, id: \.self) { row in
        Text("Row n°\(row)")
      }
      .navigationTitle("ControlGroup Sample")
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

struct ControlGroupView_Previews: PreviewProvider {
  static var previews: some View {
    ControlGroupView()
  }
}
