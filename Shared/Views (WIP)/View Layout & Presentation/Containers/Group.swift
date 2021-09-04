//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Une `View` "container" qui permet de rassembler 10 subviews en une `View`
///
/// 5 init pour un `Group` :
///   - init(@ViewBuilder content: () -> Content) where Content : View
///   - init(@SceneBuilder content: () -> Content) where Content : Scene
///   - init(@CommandsBuilder content: () -> Content) where Content : Commands
///   - init(@ToolbarContentBuilder content: () -> Content) where Content : ToolbarContent
///   - init(@ToolbarContentBuilder content: () -> Content) where Content : CustomizableToolbarContent
///
/// Paramètre :
///   - @ViewBuilder content: () -> Content ––> un ensemble de `View` (maximum 10 subviews)
///   - @SceneBuilder content: () -> Content ––> un ensemble de `Scene`
///   - @CommandsBuilder content: () -> Content ––> un ensemble de `Command`
///   - @ToolbarContentBuilder content: () -> Content ––> un ensemble de `ToolbarContent`
///
/// Remarques :
///   - En SwiftUI presque toutes les `View` "container" prennent en paramètre un `@ViewBuilder`. Ce dernier permet de définir le layout pour 10 subviews
///   - Les groupes permettent de pallier à cette "limitation" de 10 subviews, en regroupant plusieurs `View` en une seule via l'utilisation d'un `Group`

struct GroupSample: View {

  var body: some View {
    NavigationView {
      VStack {
        Text("1")
        Text("2")
        Text("3")
        Text("4")
        Text("5")
        Text("6")
        Text("7")
        Text("8")
        Text("9")
        Group {
          Text("10")
          Text("11")
          Text("12")
          Text("13")
          Text("13")
          Text("Ainsi de suite...")
        }
        .foregroundColor(.red)
      }
      .navigationTitle("Group sample")
    }
  }
}

struct GroupSample_Previews: PreviewProvider {
  static var previews: some View {
    GroupSample()
  }
}
