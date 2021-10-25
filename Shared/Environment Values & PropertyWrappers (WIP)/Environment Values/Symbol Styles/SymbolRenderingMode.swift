//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Le mode de rendu des symboles (SF Symbols)
///
/// Définition de l'`EnvironmentValue` :
///   - var symbolRenderingMode: SymbolRenderingMode? { get set }
///     - nil indique que le mode est choisi automatiquement en utilisant l'image et le style de premier plan comme paramètre
///     - SymbolRenderingMode :
///       - hierarchical :
///         - Rend les symboles sous forme de couches multiples, avec différentes opacités appliquées au style de premier plan
///         - La première couche est remplie avec le style de premier plan, et les autres avec les variantes secondaires et tertiaires
///         - Si qu'un seul style alors les autres styles dérivent automatiquement de ce style
///       - monochrome :
///         - Rend les symboles comme une couche unique remplie du style de premier plan
///       - multicolor :
///         - Rend les symboles sous forme de couches multiples avec leurs propres style ou avec le style du premier plan
///       - palette :
///         - Rend les symboles sous forme de couches multiples, avec différents styles appliqués aux couches
///         - SwiftUI fait correspondre chaque couche successiveement définit dans l'image à la variante suivante des variantes primaire, secondaire et tertiaire du style de premier plan
///         - Si qu'un seul style alors les autres styles dérivent automatiquement de ce style
///
/// Remarques :
///   - Lorsqu'on spécifie plusieurs style le mode switch automatiquement à `palette`
///   - Pour modifier spécifiquement une vue on utilisera le modifier `symbolRenderingMode(_:)`, `foregroundStyle(_:_:)` et `foregroundStyle(_:_:_:)`
///   - Pour customizer ces mode on utilisera les modifiers `foregroundStyle(_:)`

struct SymbolRenderingMode: View {

  @Environment(\.symbolRenderingMode) private var symbolRenderingMode

  var body: some View {
    if symbolRenderingMode == .hierarchical {
      Image(systemName: "exclamationmark.triangle.fill")
        .symbolRenderingMode(.hierarchical)
        .foregroundStyle(Color.purple)
    } else if symbolRenderingMode == .monochrome {
      Image(systemName: "exclamationmark.triangle.fill")
        .symbolRenderingMode(.monochrome)
        .foregroundStyle(Color.purple)
    } else if symbolRenderingMode == .multicolor {
      Image(systemName: "exclamationmark.triangle.fill")
        .symbolRenderingMode(.multicolor)
    } else if symbolRenderingMode == .palette {
      Image(systemName: "exclamationmark.triangle.fill")
        .symbolRenderingMode(.palette) // pas obligatoire
        .foregroundStyle(Color.yellow, Color.cyan)
    }
  }
}

struct SymbolRenderingMode_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SymbolRenderingMode()
        .environment(\.symbolRenderingMode, .hierarchical)
      SymbolRenderingMode()
        .environment(\.symbolRenderingMode, .monochrome)
      SymbolRenderingMode()
        .environment(\.symbolRenderingMode, .multicolor)
      SymbolRenderingMode()
        .environment(\.symbolRenderingMode, .palette)
    }
  }
}
