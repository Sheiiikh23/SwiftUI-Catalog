//
//  TabViewStyleModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 01/07/2020.
//

import SwiftUI

/// Nouveau TabBarStyle preopre pour les TabView :
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// TabViewStyle présents nativement (cf watchExtension) :
///   • DefaultTabViewStyle ––> par défaut
///   • PageTabViewStyle ––> agit comme un pageControl

struct DefaultTabViewStyleModifier: View {
  var body: some View {
    TabView {
      Text("Hello")
        .tabItem { Image(systemName: "person") }
      Text("Yo")
        .tabItem { Image(systemName: "person") }
      Text("Nihao")
        .tabItem { Image(systemName: "person") }
    }
    /// Activer / désativer ce modifier ne provequera aucun changement
    .tabViewStyle(DefaultTabViewStyle())
  }
}

struct PageTabViewStyleModifier: View {
  var body: some View {
    TabView {
      Text("Hello")
      Text("Yo")
      Text("Nihao")
    }
    /// Agit comme un pageControl
    .tabViewStyle(PageTabViewStyle())
    /// Modifier très utile à utiliser lors de l'usage de Page  TabViewStyle
    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
  }
}

struct TabViewStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DefaultTabViewStyleModifier()
      PageTabViewStyleModifier()
    }
  }
}
