//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de connaître le nombre maximum de ligne qu'un `Text` peut occuper dans la vue
///
/// Définition de l'`EnvironmentValue` :
///   - var lineLimit: Int? { get set }
///     - nil par défaut
///
/// Remarque :
///   - Pour setter le nombre maximum de lignes d'un `Text` en particulier, on utilise le modifier `.lineLimit(_:)`

struct LineLimit: View {

  @Environment(\.lineLimit) private var lineLimit

  var body: some View {
    VStack(spacing: 20) {
      Text("Line limit : \(lineLimit ?? -99)")
        .font(.title)
        .fontWeight(.bold)
      Text(String.createRandom(length: 500))
    }
    .padding(.horizontal)
  }
}

struct LineLimit_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LineLimit()
      LineLimit()
        .environment(\.lineLimit, 1)
      LineLimit()
        .environment(\.lineLimit, 10)
      LineLimit()
        .environment(\.lineLimit, 99)
    }
  }
}
