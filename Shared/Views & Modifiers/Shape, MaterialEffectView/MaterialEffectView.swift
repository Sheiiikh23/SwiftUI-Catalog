//
//  VisualEffectView.swift
//  iOS
//
//  Created by Lucas Abijmil on 09/06/2021.
//

import SwiftUI

/// ShapeStyle est qui est conforme à Material équivalent à UIVisualEffectView en UIKit
/// Disponible sur : i•Pad•OS / tvOS / macOS / Mac Catalyst
///
/// 4 cases :
///  - regularMaterial,
///     • thickMaterial
///     • ultraThinMaterial
///     • ultraThickMaterial
/// Peut être directement utilisé en temps que background car conform à View
/// Souvent utilisé avec `safeAreaInset(edge:)`

// MARK: - Utilisation : Permet de mettre un background translucide qui s'adapte en fonction du thème

struct MaterialEffectView: View {

  let materials: [Material] = [.regularMaterial, .thickMaterial, .ultraThinMaterial, .ultraThickMaterial]

  var body: some View {
    VStack {
      ForEach(materials.indices) { index in
        ZStack {
          Image("bg-slider-home-1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
          Text("Cool je visite Paris")
            .padding()
            .background(materials[index])
        }
      }
    }
  }
}

struct MaterialView: View {

  var body: some View {
    ZStack {
      Image("bubble_background")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .ignoresSafeArea()
      VStack(alignment: .leading, spacing: 4) {
        Text("Gradient text")
          .font(.largeTitle)
          .fontWeight(.bold)
          .foregroundStyle(
            .linearGradient(colors: [.purple, .blue],
                            startPoint: .topLeading, endPoint: .bottomTrailing)
          )
        Text("Text with Overlay")
          .font(.largeTitle)
          .fontWeight(.bold)
          .blendMode(.overlay)
      }
      .padding(60)
      .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
    }
  }
}

struct VisualEffectView_Previews: PreviewProvider {
  static var previews: some View {
    MaterialEffectView()
    MaterialView()
  }
}
