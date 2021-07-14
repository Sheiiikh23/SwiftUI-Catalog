//
//  FontModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 17/12/2020.
//

import SwiftUI

/// Les standard fonts permettent l'utilisation des dynamiques sizes (= adaptatives aka Dynamic Type) en fonction des préférences de l'utilisateur concernant la taille des textes 👍
///
/// Standard fonts :
///   • largeTitle (34 points)
///   • title (28 points)
///   • title2 (22 points)
///   • title3 (20 points)
///   • headline, semi-bold par défaut (17 points)
///   • body, taille par défaut (17 points)
///   • callout (16 points)
///   • subheadline (15 points)
///   • footnote (13 points)
///   • caption (12 points)
///   • caption2 (11 points)

// MARK: - Utilisation : Donne une taille relative pour les View prenant en paramètre des Strings (Text, Textfield...) qui scale selon les préférences de l'utilisateur

struct FontStandardModifier: View {

  let fontStyles: [Font] = [.largeTitle, .title, .title2, .title3, .headline, .body, .callout, .subheadline, .footnote, .caption, .caption2]

  var body: some View {
    VStack(spacing: 50) {
      ForEach(fontStyles, id: \.self) { fontStyle in
        Text("Hello, World!")
          .font(fontStyle)
      }
    }
  }
}

struct FontStandardModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      FontStandardModifier()
      FontStandardModifier()
        .environment(\.sizeCategory, .extraSmall)
      FontStandardModifier()
        .environment(\.sizeCategory, .extraExtraLarge)
    }
  }
}
