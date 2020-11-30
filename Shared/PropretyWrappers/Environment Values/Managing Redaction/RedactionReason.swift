//
//  RedactionReason.swift
//  iOS
//
//  Created by Lucas Abijmil on 30/11/2020.
//

import SwiftUI

/// redactionReasons permet de connaître la raison de la rédaction actuelle
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// redactionReasons : RedactionReasons { get set }
/// Permet d'appliquer une censure aux données affichées à l'écran

// MARK: - Importance pour l'accessibilité : faible – très faible
// MARK: - Utilisation : Pas besoin car déjà natif avec le modifier .redacted(reason: RedactionReasons)


struct RedactionReason: View {

  @Environment(\.redactionReasons) var redactionReasons

  var body: some View {
    VStack {
      Text("Hello mother fucker")
        .redacted(reason: .placeholder)
      Text("Hello mother fucker")
    }
  }
}

struct RedactionReason_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      RedactionReason()
      RedactionReason()
        .environment(\.redactionReasons, .placeholder)
    }
  }
}
