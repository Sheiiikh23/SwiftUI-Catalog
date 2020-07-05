//
//  MinimumScaleFactor.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 29/07/2020.
//

import SwiftUI

/// minimumScaleFactor proprotion minimale autorisé afin de réduire la police pour faire tenir un maximum de text
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// minimumScaleFactor: { get set } (compris entre 0 et 1)
///   - 1 : par défaut (pas de restriction)
///   - 0 ≤ x ≤ 1 : indique le d'espace en point

// MARK: - Importance pour l'accessibilité : très faible - faible
// MARK: - Utilisation : Pas besoin car déjà natif avec le modifier en question

struct MinimumScaleFactor: View {

  @Environment(\.minimumScaleFactor) var minScaleFactor
  @State private var myTextField = "Beaucoup de texte mais genre vraiment beaucoup"

    var body: some View {
      HStack {
        Text("This is a very long text: ")
          .lineLimit(1)
          .minimumScaleFactor(0.8)
        TextField("My lon textfield", text: $myTextField)
          .frame(width: 250, height: 50)
      }
    }
}

struct MinimumScaleFactor_Previews: PreviewProvider {
    static var previews: some View {
        MinimumScaleFactor()
    }
}
