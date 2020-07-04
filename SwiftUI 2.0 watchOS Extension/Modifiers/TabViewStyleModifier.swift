//
//  TabViewStyleModifier.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 01/07/2020.
//

import SwiftUI

/// Nouveau TabBarStyle preopre pour les TabView :
///
///
/// TabViewStyle présents nativement :
///   • DefaultTabViewStyle / PageTabViewStyle ––> Page control par défaut
///   • CarouselTabViewStyle ––> Page control "à la vertical"

struct DefaultTabViewStyleModifier: View {
  var body: some View {
    TabView {
      Text("Yo")
      Text("Hey")
      Text("Nihao")
    }
    /// Activer / Désactiver ce modifier ne provequera aucun changement
    .tabViewStyle(DefaultTabViewStyle())
  }
}

struct PageTabViewStyleModifier: View {
  var body: some View {
    TabView {
      Text("Yo")
      Text("Hey")
      Text("Nihao")
    }
    /// Activer / Désactiver ce modifier ne provequera aucun changement
    .tabViewStyle(PageTabViewStyle())
  }
}

struct CarouselTabViewStyleModifier: View {
  var body: some View {
    TabView {
      Text("Yo")
      Text("Hey")
      Text("Nihao")
    }
    /// Carousel : Page Control à la vertical
    .tabViewStyle(CarouselTabViewStyle())
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
