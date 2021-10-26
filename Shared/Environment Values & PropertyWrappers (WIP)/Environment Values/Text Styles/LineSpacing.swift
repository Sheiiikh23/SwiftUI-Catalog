//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de connaître la distance en points entre le bas d'une ligne et le haut de la ligne suivante
///
/// Définition de l'`EnvironmentValue` :
///   - var lineSpacing: CGFloat { get set }
///    - 0 par défaut
///    - ⚠️ Obligatoirement non négative
///
/// Remarque :
///   - Pour setter la distance pour un `Text` donné, on utilise le modifier `lineSpacing(_:)`

struct LineSpacing: View {

  @Environment(\.lineSpacing) private var lineSpacing

  var body: some View {
    VStack(spacing: 20) {
      Text("Line spacing : \(String(format: "%.0f", lineSpacing))")
        .font(.title)
        .fontWeight(.bold)
      Text(String.createRandom(length: 500))
    }
    .padding(.horizontal)
  }
}

struct LineSpacing_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LineSpacing()
      LineSpacing()
        .environment(\.lineSpacing, 2)
      LineSpacing()
        .environment(\.lineSpacing, 8)
      LineSpacing()
        .environment(\.lineSpacing, 20)
    }
  }
}
