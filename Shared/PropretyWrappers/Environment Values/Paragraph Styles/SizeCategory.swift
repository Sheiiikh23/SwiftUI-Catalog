//
//  SizeCategory.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 10/08/2020.
//

import SwiftUI

/// sizeCategory indique la taille du texte préférée par l'utilisateur
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// sizeCategory: ContentSizeCategory { get set } 
///   - small
///   - medium
///   - large : par défaut
///   - extraSmall
///   - extraLarge
///   - extraExtraLarge
///   - extraExtraExtraLarge
///   - accessibilityMedium
///   - accessibilityLarge
///   - accessibilityExtraLarge
///   - accessibilityExtraExtraLarge
///   - accessibilityExtraExtraExtraLarge
///

// MARK: - Importance pour l'accessibilité : faible - très faible
// MARK: - Utilisation : Pas besoin car déjà natif avec le modifier .font(.fontFamily)

struct SizeCategory: View {

  @Environment(\.sizeCategory) private var sizeCategory

  var body: some View {
    VStack {
      if case .small = sizeCategory {
        Text("Small Size font prefered by the user")
      } else if case .medium = sizeCategory {
        Text("Medium Size font prefered by the user")
      } else if case .large = sizeCategory {
        Text("Large Size font prefered by the user")
      } else if case .extraSmall = sizeCategory {
        Text("ExtraSmall Size font prefered by the user")
      } else if case .extraLarge = sizeCategory {
        Text("ExtraLarge Size font prefered by the user")
      } else if case .extraExtraLarge = sizeCategory {
        Text("ExtraExtraLarge Size font prefered by the user")
      } else if case .extraExtraExtraLarge = sizeCategory {
        Text("ExtraExtraExtraLarge Size font prefered by the user")
      } else if case .accessibilityMedium = sizeCategory {
        Text("AccessibilityMedium Size font prefered by the user")
      } else if case .accessibilityLarge = sizeCategory {
        Text("AccessibiilityLarge Size font prefered by the user")
      } else if case .accessibilityExtraLarge = sizeCategory {
        Text("AccessibilityExtraLarge Size font prefered by the user")
      } else if case .accessibilityExtraExtraLarge = sizeCategory {
        Text("AccessibilityExtraExtraLarge Size font prefered by the user")
      } else if case .accessibilityExtraExtraExtraLarge = sizeCategory {
        Text("AccessibilityExtraExtraExtraLarge Size font prefered by the user")
      }
    }
  }
}

struct SizeCategory_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SizeCategory()
      SizeCategory()
        .environment(\.sizeCategory, .accessibilityLarge)
      SizeCategory()
        .environment(\.sizeCategory, .small)
    }
  }
}
