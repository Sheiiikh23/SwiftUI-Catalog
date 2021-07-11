//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Une `View` qui arrange ses sous-vues de manière verticale
///
/// 1 init pour un `VStack` :
///   - init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) where Content : View
///
/// Paramètres :
///   - alignment: `HorizontalAlignment` = .center ––> l'alignement horizontal de chaque subview
///       - leading
///       - center
///       - trailing
///   - spacing: `CGFloat?` = nil ––> la distance vertical entre chaque subview, `nil` pour une valeur par défaut
///   - @ViewBuilder content: () -> Content ––> un ensemble de `View` (maximum 10 subviews)
///
/// Remarque :
///   - Par défaut un `VStack` prend le moins de height & width possible

import SwiftUI

struct VStackView: View {

  @State private var alignment: HorizontalAlignment = .center
  @State private var spacing: Double = 10

  var body: some View {
    NavigationView {
      VStack(spacing: .large) {
        Text("Alignment : \(alignment.description)")
        HStack(spacing: .medium) {
          Button("Leading") { alignment = .leading }
          Button("Center") { alignment = .center }
          Button("Trailing") { alignment = .trailing }
        }
        VStack {
          Text("Spacing value : \(Int(spacing))")
            .fontWeight(.bold)
          Slider(value: $spacing, in: 0...50)
        }
        VStack(alignment: alignment, spacing: spacing) {
          Text("Peu de texte")
          Text("Beacoup plus de texte")
          Text("Beaucoup beaucoup plus de texte")
        }
        .padding()
        .background(Color.mint)
      }
      .padding(.horizontal)
    }
  }
}

struct VStackView_Previews: PreviewProvider {
  static var previews: some View {
    VStackView()
  }
}
