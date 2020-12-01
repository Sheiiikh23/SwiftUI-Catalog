//
//  DisplayScale.swift
//  iOS
//
//  Created by Lucas Abijmil on 01/12/2020.
//

import SwiftUI

/// displayScale indique la résolution de l'écran du device
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Cataclyst
///
/// displayScale: CGFloat { get set }
/// Plusieur résolution disponible :
///  • 1x : 1 point = 1 pixel x 1 pixel
///  • 2x : 1 point = 2 pixels x 2 pixels
///  • 3x : 1 point = 3 pixels x 3 pixels

// MARK: - Importance pour l'accessibilité : très faible - faible
// MARK: - Utilisation : Très peu utile

struct DisplayScale: View {

  @Environment(\.displayScale) private var displayScale

  var body: some View {
    Text("Display scale : \(displayScale)")
  }
}

struct DisplayScale_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DisplayScale()
        .previewDevice("iPhone 12 Pro Max")
      DisplayScale()
        .previewDevice("iPhone 8")
    }
  }
}
