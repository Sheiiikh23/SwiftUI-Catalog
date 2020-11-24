//
//  IndexViewStyleModifier & PageIndexViewStyle.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 01/07/2020.
//

import SwiftUI

/// IndexViewStyle permet de mettre en forme le PageIndexViewStyle (uniquement pour le background)
/// Ce modifier et cette structure sont donc indissociable
/// Disponible sur : i•Pad•OS / tvOS / Mac Catalyst
///
/// Les options de PageIndexViewStyle :
///  • automatic : par défaut, comportement en fonction de la plateforme
///  • interactive : le background est affiché uniquement lorsque l'utilisateur change d'index via les dots (comme sur le springboard)
///  • always : le background est toujours affiché
///  • never : le background n'est jamais affiché

// MARK: - Utilisation : Mettre en forme le PageIndexViewStyle

struct PageIndexViewStyleAutomatic: View {

  @State private var selection = 0

  var body: some View {
    TabView(selection: $selection) {
      Text("Hello")
        .tag(0)
      Text("Yo")
        .tag(1)
      Text("Nihao")
        .tag(2)
    }
    .background(Color.yellow)
    .tabViewStyle(PageTabViewStyle())
    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
  }
}

struct PageIndexViewStyleInteractive: View {

  @State private var selection = 0

  var body: some View {
    TabView(selection: $selection) {
      Text("Hello")
        .tag(0)
      Text("Yo")
        .tag(1)
      Text("Nihao")
        .tag(2)
    }
    .background(Color.yellow)
    .tabViewStyle(PageTabViewStyle())
    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
  }
}

struct PageIndexViewStyleAlways: View {

  @State private var selection = 0

  var body: some View {
    TabView(selection: $selection) {
      Text("Hello")
        .tag(0)
      Text("Yo")
        .tag(1)
      Text("Nihao")
        .tag(2)
    }
    .background(Color.yellow)
    .tabViewStyle(PageTabViewStyle())
    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
  }
}

struct PageIndexViewStyleNever: View {

  @State private var selection = 0

  var body: some View {
    TabView(selection: $selection) {
      Text("Hello")
        .tag(0)
      Text("Yo")
        .tag(1)
      Text("Nihao")
        .tag(2)
    }
    .background(Color.yellow)
    .tabViewStyle(PageTabViewStyle())
    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
  }
}

struct IndexViewStyleModifier_PageIndexViewStyle_preview: PreviewProvider {
  static var previews: some View {
    PageIndexViewStyleAutomatic()
    PageIndexViewStyleInteractive()
    PageIndexViewStyleAlways()
    PageIndexViewStyleNever()
  }
}
