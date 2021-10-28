//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Ouvre une URL en utilisant l'`OpenURLAction` de l'environnement
///
/// Définition de l'`EnvironmentValue` :
///   - var openURL: OpenURLAction { get set }
///     - s'utilisie via les fonctions `func callAsFunction(_:)` et `callAsFunction(_:, completion:)`, qui peuvent être appellé deuis la propriété
///
/// Remarque :
///   - Utilise le navigateur par défaut de l'utilisateur en fonction de ses préférences (safari, chrome...)

struct OpenURL: View {

  @Environment(\.openURL) private var openURL
  private let defaultUrl = URL(string: "https://www.google.com")!

  var body: some View {
    VStack(spacing: 20) {
      Button {
        openURL(defaultUrl)
      } label: {
        Text("Go to Google")
      }

      Button {
        openURL(defaultUrl) { accepted in
          print("User did accept to go to the url : \(accepted)")
        }
      } label: {
        Text("Go to Google")
      }
    }
  }
}

struct OpenURL_Previews: PreviewProvider {
  static var previews: some View {
    OpenURL()
  }
}
