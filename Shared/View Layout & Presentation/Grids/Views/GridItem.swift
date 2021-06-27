//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, watchOS .0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Un `GridItem` permet de créer une row ou column au sein d'une `LazyHGrid` ou `LazyVGrid`.
///               Un `Array` de `GridItem` déterminent le layout d'une grid.
///
/// 1 init pour un `GridItem` :
///   - init(_ size: GridItem.Size = .flexible(), spacing: CGFloat? = nil, alignment: Alignment? = nil)
///
/// Paramètres :
///   - size: `GridItem.Size` = .flexible()
///       - adaptive(minimum: CGFloat, maximum: CGFloat = .infinity)
///       - fixed(CGFloat)
///       - flexible(minimum: CGFloat = 10, maximum: CGFloat = .infinity)
///   - spacing: `CGFloat?` = nil
///   - alignment: `Alignment?` = nil
///       - top
///       - leading
///       - bottom
///       - trailing
///       - center
///       - topLeading
///       - topTrailing
///       - bottomLeading
///       - bottomTrailing

// MARK: Fonctionnement d'un GridItem :
/// Chaque cas de `GridItem.Size` est associé avec une ou plusieurs valeurs qui déterminent :
///   - la height de la row dans une `LazyHGrid`
///   - la width de la column dans une `LazyVGrid`
///
/// Enfin chaque cas de `GridItem.Size` a sa spécificité :
///   - adaptive : met le maximum de rows ou columns afin de remplir tout l'espace disponible (portrait comme landscape)
///   - fixed : prend la height ou width passé en paramètre
///   - flexible : prend toute la height ou width qui lui est disponible
///
/// Le spacing passé en pamètre indique :
///   - dans une `LazyHGrid` : l'espacement vertical entre chaque row / GridItem
///   - dans une `LazyVGrid` : l'espacement horizontal entre chaque column / GridItem
///
/// Vidéo pour comprendre la disposition des `GridItem` dans une `LazyHGrid` ou `LazyVGrid` : https://swiftui-lab.com/wp-content/uploads/2020/07/layouts.mp4
