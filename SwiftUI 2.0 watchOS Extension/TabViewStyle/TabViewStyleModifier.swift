//
//  TabViewStyleModifier.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 01/07/2020.
//

import SwiftUI

/// TabViewStyle permet de définir le style d'une TabView
///
/// TabViewStyle spécifique à watchOS :
///   • DefaultTabViewStyle / PageTabViewStyle ––> Page control par défaut
///   • CarouselTabViewStyle ––> Page control "à la vertical"

struct DefaultTabViewStyleModifier: View {
  var body: some View {
    TabView {
      Text("Yo")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
      Text("Hey")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
      Text("Nihao")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
    }
    /// Activer / Désactiver ce modifier ne provequera aucun changement
    .tabViewStyle(DefaultTabViewStyle())
  }
}

struct PageTabViewStyleModifier: View {
  var body: some View {
    TabView {
      Text("Yo")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
      Text("Hey")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
      Text("Nihao")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
    }
    /// Activer / Désactiver ce modifier ne provequera aucun changement
    .tabViewStyle(PageTabViewStyle())
  }
}

struct CarouselTabViewStyleModifier: View {

  @State private var selection = 0

  var body: some View {
    TabView(selection: $selection) {
      Text("Yo")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
      Text("Hey")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
      Text("Nihao")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
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
      CarouselTabViewStyleModifier()
    }
  }
}
