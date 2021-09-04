//
//  LegibilityWeight.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 23/07/2020.
//

import SwiftUI

/// legibilityWeight permet de détecter si les texts sont gras par défaut
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// legibilityWeight: LegibilityWeight? { get }
///   - regular: par défaut
///   - bold: si l'utisateur l'ativé
///
/// Si activé alors les Text sont bold par défaut

// MARK: - Importance pour l'accessibilité : faible - moyenne 
// MARK: - Utilisation : Pour savoir si les textes sont déjà en gras par défaut

struct LegibilityWeight: View {
  
  @Environment(\.legibilityWeight) private var isBold

  var body: some View {
    if case .bold = isBold {
      Text("Legibility weight is activated, bold fontWeight by default")
        .foregroundColor(.black)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.green)
        .clipShape(Capsule())
    } else {
      Text("Legibility weight is deactivated, regular fontWeight by default")
        .foregroundColor(.white)
        .fontWeight(.thin)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.red)
        .clipShape(Capsule())
    }
  }
}

struct LegibilityWeight_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LegibilityWeight()
      LegibilityWeight()
        .environment(\.legibilityWeight, .bold)
    }
  }
}
