//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de connaître la taille d'un pixel sur l'écran
///
/// Définition de l'`EnvironmentValue` :
///   - var pixelLength: CGFloat { get }
///
/// Remarque :
///   - La valeur est égale à 1 divisé par le displayScale
///     - 0.33 👉 résolution @3x
///     - 0.5 👉 résolution @2x
///     - 1 👉 résolution @1x

struct PixelLength: View {

  @Environment(\.pixelLength) private var pixelLength

  var body: some View {
    Text("Pixel Length: \(pixelLength)")
  }
}

struct PixelLength_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      PixelLength()
      PixelLength()
        .environment(\.displayScale, 3)
      PixelLength()
        .environment(\.displayScale, 2)
      PixelLength()
        .environment(\.displayScale, 1)
    }
  }
}
