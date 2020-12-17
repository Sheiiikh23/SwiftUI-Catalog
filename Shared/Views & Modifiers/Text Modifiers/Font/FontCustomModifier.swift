//
//  CustomFontModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// On peut désormais utiliser des fonts customs en définissant une taille et les faire scales (ou non) relativement par rapport à un Font.TextStyle
/// Prend l'espace maximum offert par son parent container (🤔)

// MARK: - Utilisation : Police custom, taille en CGFloat qui scale ou non en fonction de nos besoins

struct FontCustomModifier: View {

  var body: some View {
    VStack {
      /// Custom font qui ne scale pas avec le Dynamic Type
      Text("Custom font with fixed size (no scale)")
        .font(.custom("Georgia", fixedSize: 40))

      /// Custom font qui scale en fonction du body textStyle
      Text("Custom font with body scale by default")
        .font(.custom("Georgia", size: 40))

      /// Custom font qui scale en fonction d'un textStyle donné
      Text("Relative scale to a Font.TextStyle with custom font")
        .font(.custom("Georgia", size: 40, relativeTo: .largeTitle))
    }
  }
}

struct CustomFontModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      FontCustomModifier()
      FontCustomModifier()
        .environment(\.sizeCategory, .extraSmall)
      FontCustomModifier()
        .environment(\.sizeCategory, .extraExtraExtraLarge)
    }
  }
}
