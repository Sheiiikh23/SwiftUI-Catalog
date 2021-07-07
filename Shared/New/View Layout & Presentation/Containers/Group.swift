//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Une `View` "container" qui permet de rassembler 10 subviews en une `View`
///
/// 5 init pour un `Group` :
///   - init(content: () -> Content) where Content : View
///   - init(content: () -> Content) where Content : Scene
///   - init(content: () -> Content) where Content : Commands
///   - init(content: () -> Content) where Content : ToolbarContent
///   - init(content: () -> Content) where Content : CustomizableToolbarContent
///
/// Paramètre :
///   - @ViewBuilder content: () -> Content : un ensemble de `View` (maximum 10 subviews)
///   - @SceneBuilder content: () -> Content : un ensemble de `Scene`
///   - @CommandsBuilder content: () -> Content : un ensemble de `Command`
///   - @ToolbarContentBuilder content: () -> Content : un ensemble de `ToolbarContent`
///
/// Remarques :
///   - En SwiftUI presque toutes les `View` "container" prennent en paramètre un `@ViewBuilder`. Ce dernier permet de définir le layout pour 10 subview
///   - Les groupes permettent de pallier à cette "limitation" de 10 subviews, en regroupant plusieurs `View` en une seule via l'utilisation d'un `Group`
///   - Tout modifier appliqué au `Group` sera appliqué à l'ensemble de ces subviews

struct GroupView: View {

  var body: some View {
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
  }
}

struct GroupView_Previews: PreviewProvider {
  static var previews: some View {
    GroupView()
  }
}
