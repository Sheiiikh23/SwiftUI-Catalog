//
//  SubmitLabelModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 08/06/2021.
//

import SwiftUI

/// Modifier qui s'utilise à 99% du temps avec des Textfields. Boutton bleue (action) du keyboard (retour, search...)
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Permet de pouvoir setter le label du bouton d'action présent dans le keyboard (automatiquement translate j'imagine)

// MARK: - Utilisation : Mettre un label de bouton bien précis dans le keyboard


struct SubmitLabelModifier: View {

  @State private var whatEver = ""
  let submitLabelCases: [SubmitLabel] = [.done, .go, .send, .join, .route, .search, .return, .next, .continue]

  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        ForEach(submitLabelCases) { submitLabel in
          TextField("Submit label", text: $whatEver)
            .textFieldStyle(.roundedBorder)
            .padding()
            .submitLabel(submitLabel)
        }
      }
    }
  }
}

struct SubmitLabelModifier_Previews: PreviewProvider {
  static var previews: some View {
    SubmitLabelModifier()
  }
}

extension SubmitLabel: Identifiable {
  public var id: UUID { UUID() }
}
