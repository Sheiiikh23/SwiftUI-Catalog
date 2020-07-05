//
//  CustomFontModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Custom font modifier à traver font modifier
///
/// Désormais les customs fonts scalent automatiquement :-)

// MARK: - Utilisation : Si on souhaite utiliser des polices customs, avec une taille custom qui scale de manière automatique en fonction d'un font prédéfinis

struct CustomFontModifier: View {
  var body: some View {
    Text("Hello world")
      .font(.custom("AvenirNext-Regular", size: 30, relativeTo: .title))
  }
}

struct CustomFontModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CustomFontModifier()
      CustomFontModifier()
        .environment(\.sizeCategory, .extraExtraExtraLarge)
    }
  }
}
