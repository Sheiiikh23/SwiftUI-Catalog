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

// MARK: - Utilisation : Permet de créer un PageControl en modifiant le style d'une TabView par PageTabViewStyle

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
    .background(Color.yellow)
    /// Agit comme un pageControl
    .tabViewStyle(PageTabViewStyle())
    /// Modifier très utile à utiliser lors de l'usage de PageTabViewStyle
    /// Permet de rajouter un background derrière l'index de page 
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
