//
//  RefreshableModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 08/06/2021.
//

import SwiftUI

/// Refrashable permet de créer un pull to refresh qui appelle une fonction asynchrone (async / await propre à Swift 5.5), avec un loader
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Affiche un loader le temps du chargement (pas possible de modifier cette vue)
/// S'utilise principalement avec des View qui scroll verticalement comme une list par exemple

// MARK: - Utilisation : créer un pull-to-refresh qui appelle une fonction asynchrone

struct RefreshableModifier: View {

  var body: some View {
    NavigationView {
      List(0..<100, id: \.self) { i in
        Text("Row n°\(i)")
      }
      .refreshable {
        print("Execute an async function here")
      }
    }
  }
}

struct RefreshableModifierWithAsyncFunction: View {

  @State private var news = [NewsItem(id: 0, title: "Want the latest news?", strap: "Pull to refresh!")]

  var body: some View {
    List(news) { new in
      VStack(alignment: .leading) {
        Text(new.title)
          .font(.headline)
        Text(new.strap)
          .foregroundColor(.secondary)
      }
    }
    .refreshable {
      do {
        let url = URL(string: "https://www.hackingwithswift.com/samples/news-1.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        news = try JSONDecoder().decode([NewsItem].self, from: data)
      } catch {
        // Error handling
        print("WOOOPS ERROR")
      }
    }
  }
}

struct NewsItem: Decodable, Identifiable {
  let id: Int
  let title: String
  let strap: String
}

struct RefreshableModifier_Previews: PreviewProvider {
  static var previews: some View {
    RefreshableModifier()
    RefreshableModifierWithAsyncFunction()
  }
}
