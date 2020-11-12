//
//  LazyVStackView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 02/07/2020.
//

import SwiftUI

/// Appartion des LazyVStack : VStack où les cellules sont crées à la volée
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
/// 
/// Prend toute la width du parent container par défaut
/// Même constructeurs que les VStacks avec en plus un PinnedScrollView (cf LazyVStackViewPinned)

// MARK: - Utilisation : Création d'un VStack qui alloue les cellules à la volée (nombre important)

struct LazyVStackView: View {

  var body: some View {
    // MARK: - LazyVStack sans PinnedScrollView
    ScrollView {
      LazyVStack(spacing: 15) {
        ForEach(1...1000, id: \.self) { item in
          Text("Cell n°\(item)")
            .foregroundColor(randomColor())
            /// Construction à la volée lors du scroll
            .onAppear { print("Cell n°\(item)")}
        }
      }
    }
  }
  private func randomColor() -> Color {
    let colors: [Color] = [.red, .gray, .green, .yellow, .orange, .purple, .blue]
    return colors.randomElement() ?? colors[1]
  }
}

struct LazyVStackViewPinned: View {

  var body: some View {
    // MARK: - LazyVStack avec PinnedScrollView (ici juste header, même fonctionnement pour le footer)
    ScrollView {
      LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
        Section(header: HeaderPinnedView(title: "1 to 250")) {
          ForEach(1...250, id: \.self) { item in
            Text("Cell n°\(item)")
              .foregroundColor(randomColor())
              /// Construction à la volée lors du scroll
              .onAppear { print("Cell n°\(item)")}
          }
        }
        Section(header: HeaderPinnedView(title: "251 to 500")) {
          ForEach(251...500, id: \.self) { item in
            Text("Cell n°\(item)")
              .foregroundColor(randomColor())
              /// Construction à la volée lors du scroll
              .onAppear { print("Cell n°\(item)")}
          }
        }
        Section(header: HeaderPinnedView(title: "501 to 751")) {
          ForEach(501...751, id: \.self) { item in
            Text("Cell n°\(item)")
              .foregroundColor(randomColor())
              /// Construction à la volée lors du scroll
              .onAppear { print("Cell n°\(item)")}
          }
        }
        Section(header: HeaderPinnedView(title: "751 to 1000")) {
          ForEach(751...1000, id: \.self) { item in
            Text("Cell n°\(item)")
              .foregroundColor(randomColor())
              /// Construction à la volée lors du scroll
              .onAppear { print("Cell n°\(item)")}
          }
        }
      }
    }
  }
  private func randomColor() -> Color {
    let colors: [Color] = [.red, .gray, .green, .yellow, .orange, .purple, .blue]
    return colors.randomElement() ?? colors[1]
  }
}

struct LazyVStackView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LazyVStackView()
      LazyVStackViewPinned()
    }
  }
}

fileprivate struct HeaderPinnedView: View {

  let title: String

  var body: some View {
    Text(title)
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .background(Color.red)
  }
}
