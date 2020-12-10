//
//  TruncationMode.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 10/08/2020.
//

import SwiftUI

/// truncationMode indique l'endroit ou le texte sera tronqué si trop long
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// truncationMode: Text.TruncationMode { get set } 
///   - tail : par défaut (à la fin)
///   - middle : au milieu
///   - head : au début
/// Possibilité de set cet environment variable avec le modifier .environment(\.truncationMode, .option)

// MARK: - Importance pour l'accessibilité : faible - très faible
// MARK: - Utilisation : Pas besoin car déjà natif avec le modifier en question

struct TruncationMode: View {

  @Environment(\.truncationMode) private var truncationMode

  var body: some View {
    VStack {
      Text("Beaucoup de texte. Tronqué à gauche")
        .font(.title2)
        .truncationMode(.tail)
        .frame(width: 200, height: 50)
      Text("Beaucoup de texte. Tronqué au milieu")
        .font(.title2)
        .truncationMode(.middle)
        .frame(width: 200, height: 50)
      Text("Beaucoup de texte. Tronqué à droite")
        .font(.title2)
        .truncationMode(.head)
        .frame(width: 200, height: 50)

      Text("Beaucoup de texte. Tronqué en fonction de l'environment")
        .font(.title2)
        .frame(width: 200, height: 50)
    }
  }
}

struct TruncationMode_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TruncationMode()
        .environment(\.truncationMode, .tail)
      TruncationMode()
        .environment(\.truncationMode, .middle)
      TruncationMode()
        .environment(\.truncationMode, .head)
    }
  }
}
