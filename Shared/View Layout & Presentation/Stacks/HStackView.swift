//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Une `View` qui arrange ses sous-vues de manière horizontale
///
/// 1 signature pour un `HStack` :
///   - init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) where Content : View
/// Paramètres :
///   - alignment: `VerticalAlignment` = .center
///           - top
///           - center
///           - bottom
///           - firstTextBaseline
///           - lastTextBaseline
///   - spacing: `CGFloat?` = nil
///   - @ViewBuilder content: () -> Content : un ensemble de `View` (maximum 10 subviews)

struct HStackView: View {

  var body: some View {
    VStack {

      // alignment = .center, spacing = nil
      HStack {
        Text("Left")
        Text("Middle")
        Text("Right")
      }

      // alignment = .center, spacing = 10
      HStack(spacing: 10) {
        Text("Left")
        Text("Middle")
        Text("Right")
      }

      // alignment = .top, spacing = nil
      HStack(alignment: .top) {
        Text("Left")
        Text("Middle")
        Text("Right")
      }

      // alignment = .top, spacing = 10
      HStack(alignment: .top, spacing: 10) {
        Text("Left")
        Text("Middle")
        Text("Right")
      }

      // Maximum 10 subviews
      HStack {
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

struct HStackDemoView: View {

  @State private var alignment: VerticalAlignment = .center
  @State private var spacing: Double = 10
  var alignmentDescription: String {
    switch alignment {
    case .top:
      return "top"
    case .center:
      return "center"
    case .bottom:
      return "bottom"
    case .firstTextBaseline:
      return "first text baseline"
    case .lastTextBaseline:
      return "last text baseline"
    default:
      return ""
    }
  }

  var body: some View {
    NavigationView {
    VStack(spacing: .large) {
      Text("Alignment : \(alignmentDescription)")
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
        Slider(value: $spacing, in: 0...50, minimumValueLabel: Text("0"), maximumValueLabel: Text("50")) {
          Text("Spacing value : \(spacing)")
        }
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
    HStackDemoView()
  }
}
