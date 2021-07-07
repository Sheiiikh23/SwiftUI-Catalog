//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Une `View` qui arrange ses subviews de manière horizontale, créant chaque subview à la volée et si nécessaire (d'où le lazy)
///
/// 1 init pour un `LazyHStack` :
///   - init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content) where Content : View
///   
/// Paramètres :
///   - alignment: `VerticalAlignment` = .center ––> l'alignement vertical de chaque subview
///       - top
///       - center
///       - bottom
///       - firstTextBaseline
///       - lastTextBaseline
///   - spacing: `CGFloat?` = nil ––> la distance horizontal entre chaque subview, `nil` pour une valeur par défaut
///   - pinnedViews: `PinnedScrollableViews` = .init() ––> les types de subviews qui vont être épinglés
///       - sectionHeaders : rend le header d'une `Section` sticky
///       - sectionFooters : rend le footer d'une `Section` sticky
///   - @ViewBuilder content: () -> Content : un ensemble de `View` (maximum 10 subviews)
/// Par défaut un `LazyHStack` prend toute la height du parent-container

struct LazyHStackView: View {

  @State private var alignment: VerticalAlignment = .center
  @State private var spacing: CGFloat = 10
  @State private var showPinnedViews = false
  private var currentAlignment: Alignment {
    switch alignment {
    case .top:
      return .top
    case .bottom:
      return .bottom
    default:
      return .center
    }
  }

  var body: some View {
    VStack(spacing: .extraLarge) {
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
        Toggle("show pinnedViews ? \(showPinnedViews.description)", isOn: $showPinnedViews)
          .toggleStyle(SwitchToggleStyle(tint: .mint))
      }
      .padding(.horizontal)
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack(alignment: alignment, spacing: spacing, pinnedViews: showPinnedViews ? [.sectionHeaders, .sectionFooters] : .init()) {
          Section(header: HeaderAndFooterPinnedView(title: "1 to 250"),
                  footer: HeaderAndFooterPinnedView(title: "1 to 250")) {
            ForEach(1...250, id: \.self) { item in
              ZStack(alignment: currentAlignment) {
                randomColor()
                Text("Cell n°\(item)")
              }
              .onAppear { print("Cell n°\(item)") }
            }
          }
          Section(header: HeaderAndFooterPinnedView(title: "251 to 500"),
                  footer: HeaderAndFooterPinnedView(title: "251 to 500")) {
            ForEach(251...500, id: \.self) { item in
              ZStack(alignment: currentAlignment) {
                randomColor()
                Text("Cell n°\(item)")
              }
              .onAppear { print("Cell n°\(item)") }
            }
          }
          Section(header: HeaderAndFooterPinnedView(title: "501 to 750"),
                  footer: HeaderAndFooterPinnedView(title: "501 to 750")) {
            ForEach(501...751, id: \.self) { item in
              ZStack(alignment: currentAlignment) {
                randomColor()
                Text("Cell n°\(item)")
              }
              .onAppear { print("Cell n°\(item)") }
            }
          }
          Section(header: HeaderAndFooterPinnedView(title: "751 to 1000"),
                  footer: HeaderAndFooterPinnedView(title: "751 to 1000")) {
            ForEach(751...1000, id: \.self) { item in
              ZStack(alignment: currentAlignment) {
                randomColor()
                Text("Cell n°\(item)")
              }
              .onAppear { print("Cell n°\(item)") }
            }
          }
        }
        .frame(height: 200)
        .background(Color.gray.opacity(0.75))
      }
    }
  }
}

struct LazyHStackView_Previews: PreviewProvider {
  static var previews: some View {
    LazyHStackView()
  }
}

struct HeaderAndFooterPinnedView: View {

  let title: String

  var body: some View {
    Text(title)
      .fontWeight(.bold)
      .foregroundColor(.black)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .padding(.vertical)
      .background(Color.init(red: 255/255, green: 206/255, blue: 168/255))
  }
}
