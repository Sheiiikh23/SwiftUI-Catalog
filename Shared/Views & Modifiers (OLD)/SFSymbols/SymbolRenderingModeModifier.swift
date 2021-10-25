//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Permet de définir le mode de rendu d'un SF Symbol
///
/// 1 seule signature :
///   - func symbolRenderingMode(_ mode: SymbolRenderingMode?) -> Image
///
/// - Paramètre :
///   - mode: SymbolRenderingMode? ––> définit le mode de rendu d'un SF Symbol
///     - monochrome ––> le SF Symbol est une couche unique avec une couleur
///     - hierarchical ––> le SF Symbol est sous forme de couches multiples avec une couleur, avec des opacités différentes permettant de créer une hiérarchie au symbol
///     - multicolor ––> le SF Symbol est sous forme de couches multiples avec leur style inhérent
///     - palette ––> le SF Symbol est sous forme de couches multiples avec différentes couleurs
///
/// Remarque :
///   - avant iOS 15.0, on utilise le modifier `renderingMode(_:)`
///
/// Tips:
///   - Pour tirer à profit du mode palette, on le couple généralement avec `foregroundStyle(_:)` permettant d'appliquer des Gradient (cf `PaletteWithGradientSymbolRenderingMode`)
///   - Avec le mode monochrome ou hierarchical, on peut très bien utiliser `foregroundColor` pour set la couleur

struct SymbolRenderingModeModifier: View {

  var body: some View {
    NavigationView {
      List(Sample.allCases, rowContent: \.destination)
        .navigationTitle("SymbolRenderingMode modifier")
    }
  }
}

private enum Sample: String, Identifiable, CaseIterable {
  case monochromeMode
  case hierarchicalMode
  case multicolorMode
  case paletteMode
  case paletteWithGradient = "palette with gradient"

  var id: String { rawValue }

  @ViewBuilder var destination: some View {
    switch self {
    case .monochromeMode:
      MonochromeSymbolRenderingMode()
    case .hierarchicalMode:
      HierarchicalSymbolRenderingMode()
    case .multicolorMode:
      MulticolorSymbolRenderingMode()
    case .paletteMode:
      PaletterSymbolRenderingMode()
    case .paletteWithGradient:
      PaletteWithGradientSymbolRenderingMode()
    }
  }
}

fileprivate struct MonochromeSymbolRenderingMode: View {

  @State private var color: Color = .indigo
  let sample = Sample.monochromeMode

  var body: some View {
    NavigationLink(sample.rawValue.firstLetterCapitalized) {
      VStack {
        ColorPicker("Current color", selection: $color)
          .padding()
        Image(systemName: SFSymbol.squareAndArrowUp.rawValue)
          .font(.system(size: 144))
          .symbolRenderingMode(.monochrome)
          .foregroundColor(color)
      }
      .navigationTitle("Monochrome symbol rendering mode")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

fileprivate struct HierarchicalSymbolRenderingMode: View {

  @State private var color: Color = .indigo
  let sample = Sample.hierarchicalMode

  var body: some View {
    NavigationLink(sample.rawValue.firstLetterCapitalized) {
      VStack {
        ColorPicker("Current color", selection: $color)
          .padding()
        Image(systemName: "person.3.sequence.fill")
          .font(.system(size: 144))
          .symbolRenderingMode(.hierarchical)
          .foregroundColor(color)
      }
      .navigationTitle("Monochrome symbol rendering mode")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

fileprivate struct MulticolorSymbolRenderingMode: View {

  @State private var color: Color = .indigo
  let sample = Sample.multicolorMode

  var body: some View {
    NavigationLink(sample.rawValue.firstLetterCapitalized) {
      VStack {
        ColorPicker("Current color", selection: $color)
          .padding()
        Image(systemName: SFSymbol.personBadgePlus.rawValue)
          .font(.system(size: 144))
          .symbolRenderingMode(.multicolor)
          .foregroundColor(color)
      }
      .navigationTitle("Multicolor symbol rendering mode")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

fileprivate struct PaletterSymbolRenderingMode: View {

  @State private var color1: Color = .indigo
  @State private var color2: Color = .red
  @State private var color3: Color = .green
  let sample = Sample.paletteMode

  var body: some View {
    NavigationLink(sample.rawValue.firstLetterCapitalized) {
      VStack {
        ColorPicker("Color 1", selection: $color1)
          .padding()
        ColorPicker("Color 2", selection: $color2)
          .padding()
        ColorPicker("Color 3", selection: $color3)
          .padding()
        Image(systemName: "person.3.sequence.fill")
          .font(.system(size: 144))
          .symbolRenderingMode(.palette)
          .foregroundStyle(color1, color2, color3)

      }
      .navigationTitle("Palette symbol rendering mode")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

fileprivate struct PaletteWithGradientSymbolRenderingMode: View {

  let sample = Sample.paletteWithGradient

  var body: some View {
    NavigationLink(sample.rawValue.firstLetterCapitalized) {
      Image(systemName: SFSymbol.mic.rawValue)
        .font(.system(size: 100, weight: .regular))
        .imageScale(.large)
        .symbolVariant(.fill.circle)
        .symbolRenderingMode(.palette)
        .foregroundStyle(
          Color.white.opacity(0.8),
          Color.blue,
          LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 40))
        .navigationTitle("Palette symbol rendering mode with gradient")
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct SymbolRenderingModeModifier_Previews: PreviewProvider {

  static var previews: some View {
    SymbolRenderingModeModifier()
    MonochromeSymbolRenderingMode()
    HierarchicalSymbolRenderingMode()
    MulticolorSymbolRenderingMode()
    PaletterSymbolRenderingMode()
    PaletteWithGradientSymbolRenderingMode()
  }
}
