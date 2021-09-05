//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Un booléen qui indique si la vue associée permet l'interaction avec l'utilisateur
///
/// Définition de l'`EnvironmentValue`:
///   - var isEnabled: Bool { get set }
///       - true : par défaut
///       - false
///
/// Remarque :
///   - On peut coupler l'utilisation de cet `EnvironmentValue` avec le modifier `disabled(_:)`

struct IsEnabled: View {

  @Environment(\.isEnabled) var isEnabled

  var body: some View {
    HStack {
      if isEnabled {
        Button { } label: {
          Text("The view can interact with the user. Tap on me !")
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(.blue, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
      } else {
        Text("The view can't interact with the user.")
          .fontWeight(.bold)
          .padding(.vertical, 10)
          .padding(.horizontal, 20)
          .background(.red, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
      }
    }
  }
}

struct IsEnabled_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      IsEnabled()
      IsEnabled()
        .environment(\.isEnabled, false)
    }
  }
}
