//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : La taille actuelle du type dynamique
///
/// Définition de l'`EnvironmentValue` :
/// - var dynamicTypeSize: DynamicTypeSize { get set }
///   - DynamicTypeSize
///     - accessibility1 : La première taille d'accessibilité
///     - accessibility2 : La deuxième taille d'accessibilité
///     - accessibility3 : La troisième taille d'accessibilité
///     - accessibility4 : La quatrième taille d'accessibilité
///     - accessibility5 : La cinquième taille d'accessibilité
///     - xxxLarge : Une taille extra extra extra large
///     - xxLarge : Une taille extra extra large
///     - xLarge : Une taile extra large
///     - large : Une taile large
///     - medium : Une taille moyenne
///     - small : Une taille petite
///     - xSmall : Une taille extra petite.
///
/// Remarques :
///   - La valeur par défaut est celle choisie dans les préférences de l'utilisateur
///   - Sous MacOS, cette valeur ne peut pas être modifiée par les utilisateurs
///   - `DynamicTypeSize` peut être comparé avec les opérateurs suivants : ..., ..<, <=, <, ==, !=, >, >=, >.. (très pratique pour adapter le layout d'une View)
///   - Pour en savoir plus, voici le lien de la doc : https://developer.apple.com/documentation/swiftui/dynamictypesize
///   - Pour appliquer une font particulière à un texte on utilise le modifier `font(_:)`
///
/// Dans le simulateur : Environment Overrides –> Text ––> Choisir la taille souhaitée

struct DynamicTypeSize: View {

  @Environment(\.dynamicTypeSize) private var dynamicTypeSize

  var body: some View {
    Text(dynamicTypeSize.description)
  }
}

struct DynamicTypeSize_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ForEach(SwiftUI.DynamicTypeSize.allCases, id: \.description) { dynamicTypeSize in
        DynamicTypeSize()
          .environment(\.dynamicTypeSize, dynamicTypeSize)
      }
    }
  }
}
