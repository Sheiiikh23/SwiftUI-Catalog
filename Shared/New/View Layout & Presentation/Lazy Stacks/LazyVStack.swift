//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Une `View` qui arrange ses sous-vues de manière verticale, créant chaque subview à la volée et si nécessaire (d'où le lazy)
///
///
/// 1 init pour un `LazyVStack` :
///   - init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content) where Content : View
///
/// Paramètres :
///   - alignment: `HorizontalAlignment` = .center ––> l'alignement horizontal de chaque subview
///       - leading
///       - center
///       - trailing
///   - spacing: `CGFloat?` = nil ––> la distance vertical entre chaque subview, `nil` pour une valeur par défaut
///   - pinnedViews: `PinnedScrollableViews` = .init() ––> les types de subviews qui vont être épinglés
///       - sectionHeaders : rend le header d'une `Section` sticky
///       - sectionFooters : rend le footer d'une `Section` sticky
///   - @ViewBuilder content: () -> Content : un ensemble de `View` (maximum 10 subviews)
/// Par défaut un `LazyVStack` prend toute la width du parent-container

struct LazyVStackView: View {

  @State private var alignment: HorizontalAlignment = .center
  @State private var spacing: CGFloat = 10
  @State private var showPinnedViews = false
  private var currentAlignment: Alignment {
    switch alignment {
    case .leading:
      return .leading
    case .trailing:
      return .trailing
    default:
      return .center
    }
  }

  var body: some View {
    ScrollView {
      VStack(spacing: .extraLarge) {
        VStack(spacing: .large) {
          Text("Alignment : \(alignment.description)")
          VStack(spacing: .medium) {
            HStack(spacing: .medium) {
              Button("Leading") { alignment = .leading }
              Button("Center") { alignment = .center }
              Button("Trailing") { alignment = .trailing }
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
        LazyVStack(alignment: alignment, spacing: spacing, pinnedViews: showPinnedViews ? [.sectionHeaders, .sectionFooters] : .init()) {
          Section(header: HeaderAndFooterPinnedView(title: "1 to 250"),
                  footer: HeaderAndFooterPinnedView(title: "1 to 250")) {
            ForEach(1...250, id: \.self) { item in
              if item.isMultiple(of: 2) && item.isMultiple(of: 3) {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Beaucoup beaucoup beaucoup beaucoup de texte : \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              } else if item.isMultiple(of: 3) {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Beaucoup beaucoup de texte \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              } else if item.isMultiple(of: 2) {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Peu de texte \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              } else {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Peu de texte \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              }
            }
            .frame(height: 40)
          }

          Section(header: HeaderAndFooterPinnedView(title: "251 to 500"),
                  footer: HeaderAndFooterPinnedView(title: "251 to 500")) {
            ForEach(251...500, id: \.self) { item in
              if item.isMultiple(of: 2) && item.isMultiple(of: 3) {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Beaucoup beaucoup beaucoup beaucoup de texte : \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              } else if item.isMultiple(of: 3) {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Beaucoup beaucoup de texte \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              } else if item.isMultiple(of: 2) {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Peu de texte \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              } else {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Peu de texte \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              }
            }
            .frame(height: 40)
          }

          Section(header: HeaderAndFooterPinnedView(title: "501 to 750"),
                  footer: HeaderAndFooterPinnedView(title: "501 to 750")) {
            ForEach(501...750, id: \.self) { item in
              if item.isMultiple(of: 2) && item.isMultiple(of: 3) {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Beaucoup beaucoup beaucoup beaucoup de texte : \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              } else if item.isMultiple(of: 3) {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Beaucoup beaucoup de texte \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              } else if item.isMultiple(of: 2) {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Peu de texte \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              } else {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Peu de texte \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              }
            }
            .frame(height: 40)
          }

          Section(header: HeaderAndFooterPinnedView(title: "751 to 1000"),
                  footer: HeaderAndFooterPinnedView(title: "751 to 1000")) {
            ForEach(751...1000, id: \.self) { item in
              if item.isMultiple(of: 2) && item.isMultiple(of: 3) {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Beaucoup beaucoup beaucoup beaucoup de texte : \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              } else if item.isMultiple(of: 3) {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Beaucoup beaucoup de texte \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              } else if item.isMultiple(of: 2) {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Peu de texte \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              } else {
                ZStack(alignment: currentAlignment) {
                  randomColor()
                  Text("Peu de texte \(item)")
                }
                .onAppear { print("Cell n°\(item)") }
              }
            }
            .frame(height: 40)
          }
        }
        .background(Color.gray.opacity(0.5))
      }
    }
  }
}

struct LazyVStackView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LazyVStackView()
    }
  }
}
