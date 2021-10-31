//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : La taille actuelle du Dynamic Type, qui indique l'échelle de scale du Content
/// Deprecated : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0  👉 utilisation de `dynamicTypeSize`
///
/// Définition de l'`EnvironmentValue` :
/// - var sizeCategory: ContentSizeCategory { get set }
///   - ContentSizeCategory
///     - accessibilityExtraExtraExtraLarge : Une taille d'accessibilité extra extra extra large
///     - accessibilityExtraExtraLarge : Une taille d'accessibilité extra extra large
///     - accessibilityExtraLarge : Une taille d'accessibilité extra large
///     - accessibilityLarge : Une taille d'accessibilité large
///     - accessibilityMedium : Une taille d'accessibilité medium
///     - extraExtraExtraLarge : Une taille extra extra extra large
///     - extraExtraLarge : Une taille extra extra large
///     - extraLarge : Une taile extra large
///     - large : Une taile large
///     - medium : Une taille moyenne
///     - small : Une taille petite
///     - extraSmall : Une taille extra petite.
///
/// Remarques :
///   - La valeur par défaut est celle choisie dans les réglages de l'utilisateur
///   - `ContentSizeCategory` peut être comparé avec les opérateurs suivants : ..., ..<, <=, <, ==, !=, >, >=, >.. (très pratique pour adapter le layout d'une View)
///   - Pour en savoir plus, voici le lien de la doc : https://developer.apple.com/documentation/swiftui/dynamictypesize
///   - Pour appliquer une font particulière à un texte on utilise le modifier `font(_:)`
///
/// Dans le simulateur : Environment Overrides –> Text ––> Choisir la taille souhaitée

struct SizeCategory: View {

  @Environment(\.sizeCategory) private var sizeCategory

  var body: some View {
    Text(sizeCategory.description)
  }
}

struct SizeCategory_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      ForEach(ContentSizeCategory.allCases, id: \.name) { sizeCategory in
        SizeCategory()
          .environment(\.sizeCategory, sizeCategory)
          .previewDisplayName(sizeCategory.description.firstLetterCapitalized)
      }
    }
  }
}
