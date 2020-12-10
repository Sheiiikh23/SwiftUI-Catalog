//
//  DisableAutoCorrection.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 08/09/2020.
//

import SwiftUI

/// disableAutocorrection permet de savoir si la View hierarchie à l'auto-correction d'activée
/// Disponible sur : i•Pad•OS / tvOS / macOS / Mac Catalyst
///
/// disableAutocorrection: Bool? { get set }
///   - nil : par défaut
///   - true
///   - false
/// Possibilité de set cet environment variable avec le modifier .environment(\.disableAutocorrection, Bool?)

// MARK: - Importance pour l'accessibilité : faible - très faible
// MARK: - Utilisation : Pas besoin car déjà natif avec le modifier en question

struct DisableAutoCorrection: View {

  @Environment(\.disableAutocorrection) private var autoCorrection
  @State private var prenom = ""
  @State private var nom = ""

  var body: some View {
    VStack {
      TextField("Prénom", text: $prenom)
        .disableAutocorrection(autoCorrection! ? false : true)

      // Troll :D (!variable!)
      TextField("Prénom", text: $prenom)
        .disableAutocorrection(!autoCorrection! ? true : false)

      TextField("Nom", text: $nom)
        .disableAutocorrection(false)
    }
  }
}

struct DisableAutoCorrection_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DisableAutoCorrection()
        .environment(\.disableAutocorrection, nil)
      DisableAutoCorrection()
        .environment(\.disableAutocorrection, true)
      DisableAutoCorrection()
        .environment(\.disableAutocorrection, false)
    }
  }
}
