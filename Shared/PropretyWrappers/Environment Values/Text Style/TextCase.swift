//
//  TextCase.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 08/09/2020.
//

import SwiftUI

/// textCase indique la casse du text
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// textCase: Text.Case? { get set } 
///   - nil : par défaut (sans modification de casse)
///   - .some(.uppercase) : majuscule
///   - .some(.lowercase) : minuscule
///

// MARK: - Importance pour l'accessibilité : faible - très faible
// MARK: - Utilisation : Pas besoin car déjà natif avec le modifier en question

struct TextCase: View {
  
  @Environment(\.textCase) var textCase
  
  var body: some View {
    VStack {
      Text("Text case uppercase respect")
        .textCase(textCase == .some(.uppercase) ? .uppercase : .lowercase)

      Text("Text case uppercase non-respect")
        .textCase(textCase == .some(.uppercase) ? .lowercase : .uppercase)

      Text("Text with native textCase modifier")
        .textCase(.uppercase)
    }
  }
}

struct TextCase_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TextCase()
        .environment(\.textCase, nil)
      TextCase()
        .environment(\.textCase, .some(.uppercase))
      TextCase()
        .environment(\.textCase, .some(.lowercase))
    }
  }
}
