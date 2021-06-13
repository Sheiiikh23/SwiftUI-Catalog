//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Une `View` qui arrange ses sous-vues dans un plan en 3D
///
/// 1 signature pour un `ZStack` :
///   - init(alignment: Alignment = .center, @ViewBuilder content: () -> Content) where Content : View
/// Paramètres :
///   - alignment: `Alignment` = .center
///       - top
///       - leading
///       - bottom
///       - trailing
///       - center
///       - topLeading
///       - topTrailing
///       - bottomLeading
///       - bottomTrailing
///   - @ViewBuilder content: () -> Content : un ensemble de `View` (maximum 10 subviews)
/// Par défaut un `ZStack` prend le moins de height & width possible
///
/// Tips: Utiliser un `ZStack` pour afficher un background avec une couleur (voir `ZStackBackgroundColorView`)

struct ZStackView: View {

  @State private var alignment: Alignment = .center

  var body: some View {
    VStack(spacing: .extraLarge) {
      VStack(spacing: .medium) {
        Text("Alignment : \(alignment.description)")
        HStack(spacing: .medium) {
          Button("Top") { alignment = .top }
          Button("Leading") { alignment = .leading }
          Button("Bottom") { alignment = .bottom }
        }
        HStack(spacing: .medium) {
          Button("Trailing") { alignment = .trailing }
          Button("Center") { alignment = .center }
          Button("TopLeading") { alignment = .topLeading }
        }
        HStack(spacing: .medium) {
          Button("TopTrailing") { alignment = .topTrailing }
          Button("BottomLeading") { alignment = .bottomLeading }
          Button("BottomTrailing") { alignment = .bottomTrailing }
        }
      }
      ZStack(alignment: alignment) {
        Rectangle()
          .foregroundColor(.red)
          .frame(width: 300, height: 300)
        Rectangle()
          .foregroundColor(.orange)
          .frame(width: 150, height: 150)
        Rectangle()
          .foregroundColor(.yellow)
          .frame(width: 75, height: 75)
      }
      .animation(.linear(duration: 0.2), value: alignment)
    }
    .frame(maxWidth: .infinity)
  }
}

struct ZStackBackgroundColorView: View {

  var body: some View {
    ZStack {
      Color.mint.ignoresSafeArea()
      VStack {
        Text("Un peu de texte")
        Text("Beaucoup plus de texte")
        Text("Beaucoup beaucoup plus de texte")
      }
    }
  }
}

struct ZStackView_Previews: PreviewProvider {
  static var previews: some View {
    ZStackView()
    ZStackBackgroundColorView()
  }
}
