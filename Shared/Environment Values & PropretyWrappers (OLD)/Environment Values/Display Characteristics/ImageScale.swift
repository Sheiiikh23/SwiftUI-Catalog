//
//  ImageScale.swift
//  iOS
//
//  Created by Lucas Abijmil on 01/12/2020.
//

import SwiftUI

/// imageScale indique le scale des images
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Cataclyst
///
/// imageScale: Image.Scale { get set }
/// 3 scale possible :
///   • small
///   • medium
///   • large
/// Possibilité de set cet environment variable avec le modifier .environment(\.displayScale, CGFloat)

// MARK: - Importance pour l'accessibilité : très faible – faible
// MARK: - Utilisation : Pas besoin car déjà natif avec le modifier en question

struct ImageScale: View {

  @Environment(\.imageScale) private var imageScale

  var body: some View {
    Image(systemName: "gear")
      .imageScale(imageScale)
  }
}

struct ImageScale_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ImageScale()
        .environment(\.imageScale, .small)
      ImageScale()
        .environment(\.imageScale, .medium)
      ImageScale()
        .environment(\.imageScale, .large)
    }
  }
}
