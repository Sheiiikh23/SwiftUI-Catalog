//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : La police par défaut à appliquer aux textes
///
/// Définition de l'`EnvironmentValue` :
/// - var font: Font? { get set }
///   - Font standards :
///     - largeTitle : 34 points
///     - title : 28 points
///     - title2 (i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0) : 22 points
///     - title3 (i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0) : 20 points
///     - headline (semi-bold par défaut) : 17 points
///     - body (par défaut) : 17
///     - callout : 16 points
///     - subheadline : 15 points
///     - footnote : 13 points
///     - caption : 12 points
///     - caption2 (i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0) : 11 points
///   - Font systèmes :
///     - system(_ style: Font.TextStyle, design: Font.Design = .default) : Font système avec le style et design donnés
///     - system(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) : Font système avec la taille, graisse et design donnnés
///   - Font customs :
///     - custom(_ name: String, fixedSize: CGFloat) (i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0) : Font custom avec le nom donné et une taile fixe qui ne scale pas en fonction du DynamicType
///     - custom(_ name: String, size: CGFloat, relativeTo textStyle: Font.TextStyle) (i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0) : Font custom avec le nom donné, une taille donnée qui scale relativement en fonction du textStyle donné
///     - custom(_ name: String, size: CGFloat) : Font custom avec le nom donné et une taille donné qui se scale de la même manière que la font standard body
///   - Stylisé une Font :
///     - bold() : Ajoute de la graisse à la font
///     - italic() : Ajoute de l'italic à la font
///     - monospaced() (i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0) : La font passe à une version monospace si elle existe (font custom), sinon font monospace par défaut
///     - monospacedDigit() : Ajuste la font pour utiliser des chiffres monospécifiques
///     - smallCaps(): Ajuste la font pour activer toutes les petites lettres capitales
///     - lowercaseSmallCaps() : Ajuste la police pour activer les minuscules et les petites lettres capitales
///     - uppercaseSmallCaps() : Ajuste la font pour activer les majuscules et les petites lettres capitales
///     - weight(_ weight: Font.Weight) : Définit la graisse de la font
///     - leading(_ leading: Font.Leading) (i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0) : Ajuste la font pour utiliser l'ajustement de l'interligne
///
/// Remarques :
///   - Ordre commun : standard ou system ou custom puis style (bold, italic...)
///   - Pour modifier spécifique la font d'une vue on utilise le modifier `font(_:)`
///   - Exemple uniquement avec les fonts standard
///   - Pour plus de renseignement se référencer à la doc : https://developer.apple.com/documentation/swiftui/font
///   - Human Interface Guidelines pour la font : https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/


struct Font: View {
  var body: some View {
    Text("Hello, World!")
  }
}

struct Font_Previews: PreviewProvider {

  static let fonts = SwiftUI.Font.allCases

  static var previews: some View {
    Group {
      ForEach(fonts, id: \.self) { font in
        Font()
          .environment(\.font, font)
          .previewDisplayName(font.description.firstLetterCapitalized)
      }
    }
  }
}
