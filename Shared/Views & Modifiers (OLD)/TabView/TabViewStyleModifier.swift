//
//  TabViewStyleModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 01/07/2020.
//

import SwiftUI

/// TabViewStyle permet de définir le style d'une TabView
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// TabViewStyle présents nativement :
///   • DefaultTabViewStyle : style par défaut en fonction de la plateforme
///   • PageTabViewStyle(indexDisplayMode: .option) : permet de passer la TabView en Page Control et montrer ou non les index :
///       - always : montrera toujours les index
///       - automatic : motrera les index si le nombre de page est supérieur à 1
///       - never : ne montrera jamais les index
///       - Il est possible de cacher ou non le background des Index : cf IndexViewStyleModifier
///   • CarouselTabViewStyle: cf watchOS
///
/// J'ai utilisé le constructeur où on binde le tag (très utile) et plus solid imho

// MARK: - Utilisation : Indique la nataure de la TabView

struct DefaultTabViewStyleModifier: View {

  @State private var currentIndex = 1

  var body: some View {
    TabView(selection: $currentIndex) {
      Text("Hello")
        .tag(0)
        .tabItem { Label("Hello", systemImage: "person") }
      Text("Yo")
        .tag(1)
        .tabItem { Label("Yo", systemImage: "person") }
      Text("Nihao")
        .tag(2)
        .tabItem { Label("Hello", systemImage: "person") }
    }
    .tabViewStyle(DefaultTabViewStyle())
  }
}

struct PageTabViewStyleModifier: View {

  @State private var currentIndex = 1

  var body: some View {
    TabView(selection: $currentIndex) {
      Text("Hello")
        .tag(0)
      Text("Yo")
        .tag(1)
      Text("Nihao")
        .tag(2)
    }
    .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
    /// Agit comme un pageControl
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    /// cf IndexViewStyleModifier
    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
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
