//
//  Description.swift
//  iOS
//
//  Created by Lucas Abijmil on 01/12/2020.
//

import SwiftUI

/// description indique le contenu de l'instance des différentes @Environment values
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Cataclyst
///
/// description: String { get }

// MARK: - Importance pour l'accessibilité : très faible – faible
// MARK: - Utilisation : Très peu utile

struct Description: View {

  @Environment(\.description) private var description

  var body: some View {
    ScrollView {
      Text("\(description)")
    }
  }
}

struct Description_Previews: PreviewProvider {
  static var previews: some View {
    Description()
  }
}
