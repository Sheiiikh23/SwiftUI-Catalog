//
//  ForegroundStyleModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 10/06/2021.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Applique un style donné aux éléments du premier plan d'une `View`
///
/// 3 fonctions pour `foregroundStyle(_:)` :
///   - func foregroundStyle<S>(_ style: S) -> some View where S : ShapeStyle
///   - func foregroundStyle<S1, S2>(_ primary: S1, _ secondary: S2) -> some View where S1 : ShapeStyle, S2 : ShapeStyle
///   - foregroundStyle<S1, S2, S3>(_ primary: S1, _ secondary: S2, _ tertiary: S3) -> some View where S1 : ShapeStyle, S2 : ShapeStyle, S3 : ShapeStyle
///
/// Paramètres :
///   - style, primaryn secondary, tertiary : `ShapeStyle` ––> `Color`, `Materials`, `Angular • Elliptical • Linear • RadialGradients`, semantic style ...
///
/// Remarques :
///   - ⚠️ Si on souhaite donner un style à UNE seule instance de `Shape`, il faut utiliser le modifier `fill(style:)` (plus efficace)
///   - Lorsque le background est un `Material` l'utilisation des semantic style prend encore plus de sens

struct ForegroundStyleModifier: View {

  let colors: [Color] = [.blue, .indigo, .purple, .red, .orange, .yellow, .pink]
  let materials: [Material] = [.ultraThin, .ultraThinMaterial, .thin, .thinMaterial, .regular, .regularMaterial, .thick, .thickMaterial, .ultraThick, .ultraThickMaterial]

  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 20) {
        ForEach(colors, id: \.self) { color in
          Text("ForegroundStyle with color as ShapeStyle")
            .foregroundStyle(color)
        }
        ForEach(materials, id: \.self) { material in
          Text("ForegroundStyle with material as ShapeStyle")
            .foregroundStyle(material)
        }
        VStack(spacing: 10) {
          Text("ForegroundStyle with a AngularGradient as ShapeStyle")
            .foregroundStyle(AngularGradient(colors: [.blue, .indigo, .purple], center: .leading))
          Text("ForegroundStyle with a EllipticalGradient as ShapeStyle")
            .foregroundStyle(EllipticalGradient(colors: [.blue, .indigo, .purple], center: .leading, startRadiusFraction: .pi  / 4, endRadiusFraction: -.pi / 4))
          Text("ForegroundStyle with a LinearGradient as ShapeStyle")
            .foregroundStyle(LinearGradient(colors: [.blue, .indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
          Text("ForegroundStyle with a RadialGradient as ShapeStyle")
            .foregroundStyle(RadialGradient(colors: [.blue, .indigo, .purple], center: .leading, startRadius: 200, endRadius: 300))
        }
        VStack(spacing: 10) {
          Text("ForegroundStyle with a primary content style")
            .foregroundStyle(.primary)
          Text("ForegroundStyle with a secondary content style")
            .foregroundStyle(.secondary)
          Text("ForegroundStyle with a tertiary content style")
            .foregroundStyle(.tertiary)
          Text("ForegroundStyle with a quaternary content style")
            .foregroundStyle(.quaternary)
          Text("ForegroundStyle with a foreground content style")
            .foregroundStyle(.foreground)
          Text("ForegroundStyle with a background content style")
            .foregroundStyle(.background)
          Text("ForegroundStyle with a selection content style")
            .foregroundStyle(.selection)
          Text("ForegroundStyle with a tint content style")
            .foregroundStyle(.tint)
        }
      }
    }
    .frame(maxWidth: .infinity)
    .background(.cyan.opacity(0.75))
  }
}

struct ForegroundStyleWithMaterialBackground: View {

  var body: some View {
    ZStack(alignment: .bottom) {
      Color.orange.ignoresSafeArea()
      HStack {
        Text("Orange is the new black")
        Spacer()
        Text("Available on Netflix")
          .foregroundStyle(.secondary)
      }
      .padding()
      .background(.regularMaterial)
    }
  }
}

struct ForegroundStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    ForegroundStyleModifier()
    ForegroundStyleWithMaterialBackground()
  }
}
