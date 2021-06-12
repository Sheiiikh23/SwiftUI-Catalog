//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Une `View` qui arrange ses sous-vues de manière verticale
///
/// 1 signature pour un `VStack` :
///   - init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) where Content : View
/// Paramètres :
///   - alignment: `HorizontalAlignment` = .center
///           - leading
///           - center
///           - trailing
///   - spacing: `CGFloat?` = nil
///   - @ViewBuilder content: () -> Content : un ensemble de `View` (maximum 10 subviews)

import SwiftUI

struct VStackView: View {

  var body: some View {
    VStack {

      // alignment = .center, spacing = nil
      VStack {
        Text("Top")
        Text("Middle")
        Text("Bottom")
      }

      // alignment = .center, spacing = 10
      VStack(spacing: 10) {
        Text("Top")
        Text("Middle")
        Text("Bottom")
      }

      // alignment: .leading, spacing = nil
      VStack(alignment: .leading) {
        Text("Top")
        Text("Middle")
        Text("Bottom")
      }

      // alignment = .leading, spacing = 10
      VStack(alignment: .leading, spacing: 10) {
        Text("Top")
        Text("Middle")
        Text("Bottom")
      }

      // Maximum 10 subviews
      VStack {
        Text("1")
        Text("2")
        Text("3")
        Text("4")
        Text("5")
        Text("6")
        Text("7")
        Text("8")
        Text("9")
        Text("10")
        //        Text("11") // Error: Extra argument in call
      }
    }
  }
}

struct VStackDemoView: View {

  @State private var alignment: HorizontalAlignment = .center
  @State private var spacing: Double = 10
  var alignmentDescription: String {
    switch alignment {
    case .leading:
      return "leading"
    case .center:
      return "center"
    case .trailing:
      return "trailing"
    default:
      return ""
    }
  }

  var body: some View {
    NavigationView {
      VStack(spacing: .large) {
        Text("Alignment : \(alignmentDescription)")
        HStack(spacing: .medium) {
          Button("Leading") { alignment = .leading }
          Button("Center") { alignment = .center }
          Button("Trailing") { alignment = .trailing }
        }
        VStack {
          Text("Spacing value : \(Int(spacing))")
            .fontWeight(.bold)
          Slider(value: $spacing, in: 0...50, minimumValueLabel: Text("0"), maximumValueLabel: Text("50")) {
            Text("Spacing value : \(spacing)")
          }
        }
        VStack(alignment: alignment, spacing: spacing) {
          Text("Peu de texte")
          Text("Beacoup plus de texte")
          Text("beaucoup beaucoup plus de taxte")
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
    VStackDemoView()
  }
}
