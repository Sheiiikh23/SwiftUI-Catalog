//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Booléen qui détermine si la hiérarchie des View à l'auto-correction activée
///
/// Définition de l'`EnvironmentValue` :
///   - var disableAutocorrection: Bool? { get set }
///     - nil : par défaut, utilisation des préférences systèmes
///     - true
///     - false
///
/// Remarque :
///   - Pour désactiver l'auto-correction pour une vue on utilise le modifier `disableAutocorrection(_:)`

struct DisableAutocorrection: View {

  @Environment(\.disableAutocorrection) private var disableAutocorrection
  @State private var isAutocorrectionDisabled = false
  @State private var country = ""

  var body: some View {
    VStack {
      Toggle("Auto-correction is disabled ?", isOn: $isAutocorrectionDisabled)
      TextField("Country", text: $country)
        .textContentType(.countryName)
        .disableAutocorrection(disableAutocorrection ?? false)
    }
    .padding(.horizontal)
    .environment(\.disableAutocorrection, isAutocorrectionDisabled)
  }
}

struct DisableAutocorrection_Previews: PreviewProvider {
  static var previews: some View {
    DisableAutocorrection()
  }
}
