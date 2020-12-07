//
//  ListStyleModifier.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// ListStyle propre pour les List:
///
/// ListStyle spécifique à watchOS :
///   • CarouselListStyle
///   • EllipticalListStyle : assez similaire à CarouselListStyle & pas dispo sur Series 3

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
        .frame(height: 150)
        .onTapGesture {

        }
    }
    .listStyle(EllipticalListStyle())
  }
}



struct ListStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CarouselListStyleModifier()
      EllipticalListStyleModifier()
    }
  }
}
