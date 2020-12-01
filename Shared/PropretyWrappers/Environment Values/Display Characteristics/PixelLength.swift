//
//  PixelLength.swift
//  iOS
//
//  Created by Lucas Abijmil on 01/12/2020.
//

import SwiftUI

/// pixelLength indique le ratio d'un pixel par rapport à l'écran (en point)
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Cataclyst
///
/// pixelLength: CGFloat { get }
/// 3 valeurs possible :
///   • 0.333 : résolution @3x
///   • 0.5 : résolution @2x
///   • 1 : résolution @1x
///
/// pixelLength donne le ratio d'un pixel sur l'écran, à l'inverse de displayScale qui donne le facteur

// MARK: - Importance pour l'accessibilité : très faible - faible
// MARK: - Utilisation : Très peu utile

struct PixelLength: View {

  @Environment(\.pixelLength) private var pixelLength

  var body: some View {
    Text("Pixel Length: \(pixelLength)")
  }
}

struct PixelLength_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      PixelLength()
        .previewDevice("iPhone 12 Pro Max")
      PixelLength()
        .previewDevice("iPhone 8")
    }
  }
}
