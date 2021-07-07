//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Une `View` affiché dans la safeArea au top ou au bottom
///
/// 1 seule signature :
///   - func safeAreaInset<V>(edge: VerticalEdge, alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> V) -> some View where V : View
///
/// Paramètres :
///   - edge: `VerticalEdge` ––> positionement de la `View`
///       - top
///       - bottom
///   - alignment: `HorizontalAlignment` = .center ––> l'alignement horizontal de chaque subview
///       - leading
///       - center
///       - trailing
///   - spacing: `CGFloat?` = nil ––> La distance entre les deux vues, `nil` pour utiliser la valeur par défaut
///   - @ViewBuilder content: () -> V : un ensemble de `View` (maximum 10 subviews)

struct SafeAreaInsetModifier: View {

  @State private var edge: VerticalEdge = .bottom
  @State private var alignment: HorizontalAlignment = .center
  @State private var customAlignment: HorizontalAlignmentCustom = .center
  @State private var spacing: CGFloat = 0
  @State private var showControls = false
  let symbols = SFSymbol.allCases
  let columns = [GridItem(.adaptive(minimum: 40, maximum: 40))]

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns) {
        ForEach(symbols) { symbol in
          Image(systemName: symbol.rawValue)
            .foregroundColor(.white)
            .frame(width: 40, height: 40)
            .background(randomColor())
        }
      }
      .padding()
    }
    .safeAreaInset(edge: edge, alignment: alignment, spacing: spacing) {
      VStack(spacing: spacing) {
        Toggle("Show controls", isOn: $showControls)
          .toggleStyle(SwitchToggleStyle(tint: .mint))
          .padding()
        Divider()
        VStack(alignment: alignment, spacing: spacing) {
          Text("\(symbols.count) total SF Symbols")
            .fontWeight(.bold)
            .foregroundColor(.primary)
          Text("And so many colors available")
            .foregroundColor(.secondary)
          if showControls {
            Group {
              Picker("Edge : \(edge.description)", selection: $edge) {
                ForEach(VerticalEdge.allCases, id: \.self) { edge in
                  Text(edge.description)
                    .tag(edge)
                }
              }
              Picker("Alignment : \(customAlignment.description)", selection: $customAlignment) {
                ForEach(HorizontalAlignmentCustom.allCases) { alignment in
                  Text(alignment.description)
                    .tag(alignment)
                }
              }
              .onChange(of: customAlignment) { alignment.map($0) }
              VStack {
                Text("Spacing : " + String(format: "%.0f", spacing))
                Slider(value: $spacing, in: 0...40)
                  .accentColor(.purple)
              }
            }
            .pickerStyle(.segmented)
            .animation(.easeInOut, value: showControls)
          }
        }
        .padding()
      }
      .background(.regularMaterial)
    }
  }
}

struct SafeAreaInsetModifier_Previews: PreviewProvider {
  static var previews: some View {
    SafeAreaInsetModifier()
  }
}
