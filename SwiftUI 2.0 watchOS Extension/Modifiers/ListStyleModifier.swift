//
//  ListStyleModifier.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// Nouveau ListeStyle propre pour les List :
///   - listStyle(ListStyle) ––> i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// ListStyle natifs pour watchOS :
///   • DefaultListStyle ––> par défaut
///   • CarouselListStyle
///   • EllipticalListStyle
///   • PlainListStyle


struct DefaultListStyleModifier: View {
  var body: some View {
    List(0...20, id: \.self) { item in
      Text("Hellow row n°\(item)")
        .font(.title3)
    }
    /// Activer / désactiver ce modifier ne provequera aucun changement
    .listStyle(DefaultListStyle())
  }
}

struct CarouselListStyleModifier: View {
    var body: some View {
      List(0...20, id: \.self) { item in
        Text("Hellow row n°\(item)")
          .font(.title3)
          /// Plus la height est grande plus l'effet du carrousel est visible
          .frame(height: 150)
      }
      /// Effet de carrousel
      .listStyle(CarouselListStyle())
    }
}

struct EllipticalListStyleModifier: View {
    var body: some View {
      List(0...20, id: \.self) { item in
        Text("Hellow row n°\(item)")
          .font(.title3)
          .frame(height: 100)
      }
      /// Interaction & apparition (quia agit comme un crop ?) elliptique
      .listStyle(EllipticalListStyle())
    }
}

struct PlainListStyleModifier: View {
  var body: some View {
    List(0...20, id: \.self) { item in
      Text("Hello row n°\(item)")
        .font(.title3)
        .frame(height: 150)
    }
    /// Comme pour i•Pad•OS aucune différence
    .listStyle(PlainListStyle())
  }
}

struct ListStyleModifier_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        DefaultListStyleModifier()
        CarouselListStyleModifier()
        EllipticalListStyleModifier()
        PlainListStyleModifier()
      }
    }
}
