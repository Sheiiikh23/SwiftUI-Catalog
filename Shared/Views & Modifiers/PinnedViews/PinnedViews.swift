//
//  PinnedViews.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 03/07/2020.
//

import SwiftUI

/// PinnedViews: permet de pinner des Views au top / bottom d'une section dans un scroll
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Peut être utilisé dans des LazyStack ou LazyGrid
/// On peut pinner soit le header soit le footer ou les deux

// MARK: - Utilisation : Laisser des infos importantes lors du scroll (ancre etc...)

struct PinnedViews: View {

  var body: some View {
    // MARK: - Exemple de PinnedViews avec un LazyVStack
    ScrollView {
      LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders, .sectionFooters]) {
        Section(header: HeaderPinnedView(title: "Header 1 to 250"),
                footer: FooterPinnedView(title: "Footer 1 to 250")) {
          ForEach(1...250, id: \.self) { item in
            Text("Cell n°\(item)")
              .foregroundColor(randomColor())
              /// Construction à la volée lors du scroll
              .onAppear { print("Cell n°\(item)") }
          }
        }
        Section(header: HeaderPinnedView(title: "Header 251 to 500"),
                footer: FooterPinnedView(title: "Footer 251 to 500")) {
          ForEach(251...500, id: \.self) { item in
            Text("Cell n°\(item)")
              .foregroundColor(randomColor())
              /// Construction à la volée lors du scroll
              .onAppear { print("Cell n°\(item)") }
          }
        }
        Section(header: HeaderPinnedView(title: "Header 501 to 750"),
                footer: FooterPinnedView(title: "Footer 501 to 751")) {
          ForEach(501...751, id: \.self) { item in
            Text("Cell n°\(item)")
              .foregroundColor(randomColor())
              /// Construction à la volée lors du scroll
              .onAppear { print("Cell n°\(item)") }
          }
        }
        Section(header: HeaderPinnedView(title: "Header 751 to 1000"),
                footer: FooterPinnedView(title: "Footer 751 to 1000")) {
          ForEach(751...1000, id: \.self) { item in
            Text("Cell n°\(item)")
              .foregroundColor(randomColor())
              /// Construction à la volée lors du scroll
              .onAppear { print("Cell n°\(item)") }
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

struct PinnedViews_Preview: PreviewProvider {
  static var previews: some View {
    PinnedViews()
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

fileprivate struct FooterPinnedView: View {

  let title: String

  var body: some View {
    Text(title)
      .frame(maxWidth: .infinity)
      .padding(.vertical)
      .background(Color.blue)
  }
}
