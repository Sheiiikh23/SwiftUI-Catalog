//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 11.0, Mac Catalyst 13.0
/// Description : Permet de connaître l'échelle à appliquer aux images par rapport au texte
///
/// Définition de l'`EnvironmentValue`:
///   - var imageScale: Image.Scale { get set }
///       - small
///       - medium : par défaut
///       - large
///
/// Remarque :
///   - On utilise cette `EnvironmentValue` très souvent avec le modifier `imageScale(_:)`

struct ImageScale: View {

  @Environment(\.imageScale) private var imageScale

  var body: some View {
    Image(systemName: "gear")
      .imageScale(imageScale)
  }
}

struct ImageScale_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ImageScale()
      ImageScale()
        .environment(\.imageScale, .small)
      ImageScale()
        .environment(\.imageScale, .medium)
      ImageScale()
        .environment(\.imageScale, .large)
    }
  }
}
