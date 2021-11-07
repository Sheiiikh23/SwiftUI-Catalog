//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de lire et parfois écrire une valeur dans l'environnement d'une vue
///
/// 1 init pour `Environment` :
///   - init(_ keyPath: KeyPath<EnvironmentValues, Value>)
///
/// Paramètre :
///   - keyPath: KeyPath<EnvironmentValues, Value> ––> un key path vers le type d'`EnvironmentValue` souhaité
///
/// Remarque :
///   - Voir le dossier "Environment Values" pour un exemple de chaque `EnvironmentValue`

struct EnvironmentWrapper: View {

  @Environment(\.colorScheme) private var colorScheme

  var body: some View {
    Text("Current color scheme is \(colorScheme.description)")
  }
}

struct EnvironmentWrapper_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      EnvironmentWrapper()
        .environment(\.colorScheme, .light)
      EnvironmentWrapper()
        .environment(\.colorScheme, .dark)
    }
  }
}
