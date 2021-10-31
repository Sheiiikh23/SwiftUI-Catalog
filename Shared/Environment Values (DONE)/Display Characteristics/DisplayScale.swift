//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de connaître la résolution du device
///
/// Définition de l'`EnvironmentValue` :
///   - var displayScale: CGFloat { get set }
///
/// Remarques :
///   - Il existe 3 type de résolution :
///     - 1x (point) = 1 pixel x 1 pixel
///     - 2x (points) = 2 pixels x 2 pixels
///     - 3x (points) = 3 pixels x 3 pixels
///   - Pour voir la résolution en fonction du device, c'est ici : https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions

struct DisplayScale: View {

  @Environment(\.displayScale) private var displayScale

  var body: some View {
    Text("Display scale : \(displayScale)x")
  }
}

struct DisplayScale_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DisplayScale()
        .environment(\.displayScale, 3)
      DisplayScale()
        .previewDevice("iPhone 12 Pro Max")
      DisplayScale()
        .previewDevice("iPhone 8")
    }
  }
}
