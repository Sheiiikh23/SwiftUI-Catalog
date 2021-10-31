//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : La variant à appliquer aux SF Symbols au sein d'une `Image` ou `Label
///
/// Définition de l'`EnvironmentValue` :
///   - var symbolVariants: SymbolVariants { get set }
///     - SymbolVariants :
///       - none ––> `outline` style
///       - slash ––> `slash` style
///       - circle, rectangle, square ––> `enclosing` style avec shape
///       - fill ––> `fill` style
///
/// Remarques :
///   - Ordre commun : .slash (ou non) puis .shape (ou non) puis .fill (ou non) | .none
///   - Pour modifier spécifiquement une vue on utilisera le modifier `symbolVariant(_:)`
///   - On peut enchainer les styles au seins d'un même `symbolVariant(_:)`

import SwiftUI

struct SymbolVariants: View {

  @Environment(\.symbolVariants) private var symbolVariants
  @State private var currentSymbolVariants = SwiftUI.SymbolVariants.none

  var body: some View {
    NavigationView {
      VStack {
        Menu("Symbol Variant") {
          ForEach(SwiftUI.SymbolVariants.allCases, id: \.descrition) { variant in
            Button { currentSymbolVariants = variant } label: { Text(variant.descrition) }
          }
        }
        Group {
          switch currentSymbolVariants {
          case .rectangle, .rectangle.fill:
            Label("Xmark", systemImage: "xmark")
          default:
            Label("Trash", systemImage: "trash")
          }
        }
        .foregroundColor(.red)
      }
    }
    .environment(\.symbolVariants, currentSymbolVariants)
  }
}

struct SymbolVariants_Previews: PreviewProvider {
  static var previews: some View {
    SymbolVariants()
  }
}
