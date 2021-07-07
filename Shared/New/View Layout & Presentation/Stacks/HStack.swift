//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Une `View` qui arrange ses subviews de manière horizontale
///
/// 1 init pour un `HStack` :
///   - init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) where Content : View
/// 
/// Paramètres :
///   - alignment: `VerticalAlignment` = .center ––> l'alignement vertical de chaque subview
///       - top
///       - center
///       - bottom
///       - firstTextBaseline
///       - lastTextBaseline
///   - spacing: `CGFloat?` = nil ––> la distance horizontal entre chaque subview, `nil` pour une valeur par défaut
///   - @ViewBuilder content: () -> Content : un ensemble de `View` (maximum 10 subviews)
/// Par défaut un `HStack` prend le moins de height & width possible

struct HStackView: View {

  @State private var alignment: VerticalAlignment = .center
  @State private var spacing: Double = 10

  var body: some View {
    NavigationView {
      VStack(spacing: .large) {
        Text("Alignment : \(alignment.description)")
        VStack(spacing: .medium) {
          HStack(spacing: .medium) {
            Button("Top") { alignment = .top }
            Button("Center") { alignment = .center }
            Button("Bottom") { alignment = .bottom }
          }
          HStack(spacing: .medium) {
            Button("First text baseline") { alignment = .firstTextBaseline }
            Button("Last text baseline") { alignment = .lastTextBaseline }
          }
        }
        VStack {
          Text("Spacing value : \(Int(spacing))")
            .fontWeight(.bold)
          Slider(value: $spacing, in: 0...50)
        }
        HStack(alignment: alignment, spacing: spacing) {
          ZStack {
            Circle()
              .foregroundColor(.yellow)
              .frame(width: 100, height: 100)
            Text("Left")
              .font(.title)
          }
          Text("Middle")
          Text("Right")
            .font(.callout)
        }
        .padding()
        .background(Color.mint)
      }
      .padding(.horizontal)
      .navigationTitle("HStack démo")
    }
  }
}

struct HStackView_Previews: PreviewProvider {
  static var previews: some View {
    HStackView()
  }
}
