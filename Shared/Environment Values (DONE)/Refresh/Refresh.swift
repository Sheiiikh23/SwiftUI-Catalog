//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Permet d'appeler la fonction de refresh stockée dans l'environnement de la View hierarchy
///
/// Définition de l'`EnvironmentValue` :
///   - var refresh: RefreshAction? { get }
///     - nil si pas de modifier `refreshable(action:)` dans le graphe de la View hierarchy de l'`EnvironmentValue`
///     - RefreshAction :
///       1) On vérifie qu'il y a une action de refresh dans le grpahe de la View hierarchy
///       2) On utilise la fonction `callAsFunction()` qui peut être appelé depuis la propriété unwrap dans une `Task`
///
/// Remarques :
///   - Généralement on l'utilisera pour un bouton de refresh qui se situe dans une `toolbar(_:)`
///   - Dans le `Button` on utilise une `Task` pour appeler la fonction asynchrone (si async await)`
///   - Dans la View hierarchy on utilise le modifier `refreshable(action:)` afin de setter l'action dans l'environment
///   - Lien intéressant : https://sarunw.com/posts/pull-to-refresh-in-swiftui/

struct Refresh: View {

  @Environment(\.refresh) private var refresh
  @StateObject private var viewModel = ViewModel()

  var body: some View {
    NavigationView {
      List(viewModel.news) { new in
        VStack(alignment: .leading) {
          Text(new.title)
            .font(.headline)
          Text(new.strap)
            .foregroundColor(.secondary)
        }
      }
      .toolbar {
        ToolbarItem {
          RetryButton()
        }
      }
      .refreshable {
        await viewModel.fetch()
      }
      .navigationTitle("Refresh")
    }
    .environmentObject(viewModel)
  }
}

fileprivate struct RetryButton: View {

  @Environment(\.refresh) private var refresh
  @EnvironmentObject private var viewModel: ViewModel

  var body: some View {
    if let refresh = refresh {
      Button {
        Task {
          await refresh()
        }
      } label: {
        Label("Refresh", systemImage: "arrow.clockwise")
      }
    }
  }
}

@MainActor fileprivate final class ViewModel: ObservableObject {

  @Published private(set) var news: [NewsItem]

  init() {
    news = [NewsItem(id: 0, title: "Want the latest news?", strap: "Pull to refresh!")]
  }

  func fetch() async {
    do {
      let url = URL(string: "https://www.hackingwithswift.com/samples/news-1.json")!
      let (data, _) = try await URLSession.shared.data(from: url)
      news = try JSONDecoder().decode([NewsItem].self, from: data)
    } catch {
      print("WOOOPS ERROR")
    }
  }
}

struct Refresh_Previews: PreviewProvider {
  static var previews: some View {
    Refresh()
  }
}
