//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Override pour transformer la casse d'un `Text`, en utilisant la locale de l'environnemnt
///
/// Définition de l'`EnvironmentValue` :
///   - var textCase: Text.Case? { get set }
///   - nil par défaut
///   - Text.Case :
///     - lowercase : Tous les caractères sont en minuscules
///     - uppercase : Tous les caractères sont en majuscules
///
/// Remarques :
///   - Lorsque la valeur est à nil la casse est inchangée
///   - Pour changer la casse d'un `Text` particulier, on utilise `textCase(_:)`

struct TextCase: View {

  @Environment(\.textCase) private var textCase

  var body: some View {
    VStack(spacing: 20) {
      Text("Text case : \(textCase.description)")
        .font(.title)
        .fontWeight(.bold)
      Text("Hello, World!")
    }
  }
}

struct TextCase_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      TextCase()
      TextCase()
        .environment(\.textCase, .uppercase)
      TextCase()
        .environment(\.textCase, .lowercase)
    }
  }
}
