//
//  AsyncImageView.swift
//  iOS
//
//  Created by Lucas Abijmil on 09/06/2021.
//

import SwiftUI

/// AsyncImage permet d'afficher des images en asynchrone avec un placeholder, une animation etc...
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Plusieurs init possibles :
///   - init(url: URL?, scale: CGFloat = 1)
///   - init<I, P>(url: URL?, scale: CGFloat = 1, @ViewBuilder content: @escaping (Image) -> I, @ViewBuilder placeholder: @escaping () -> P) where Content == _ConditionalContent<I, P>, I : View, P : View
///   - init(url: URL?, scale: CGFloat = 1, transaction: Transaction = Transaction(), @ViewBuilder content: @escaping (AsyncImagePhase) -> Content)
///
/// Scale = nombre de point –> 1≤x≤3
///   - 1x (vieux device)
///   - 2x (récent device)
///   - 3x (très récent device)
///
/// AsyncImagePhase :
///   - case empty
///   - case success(Image) ; var image: Image? { get }
///   - case failure(Error) ; var error: Error? { get }

// MARK: - Utilisation : Charger des images en asynchrone

struct AsyncImageView: View {

  let url = URL(string: "https://hackingwithswift.com/img/paul.png")

  var body: some View {
    ScrollView {
      VStack(spacing: 30) {

        // URL, scale = 1 –> considéré comme une `View` on ne peut donc pas appliquer `resizable()`
        AsyncImage(url: url)

        // URL, scale
        AsyncImage(url: url, scale: 2)

        // URL, (AsyncImagePhase) -> Content (= some View)
        AsyncImage(url: url) { phase in
          switch phase {
          case .empty:
            Text("Empty")
          case .success(let image):
            image
              .resizable()
              .aspectRatio(contentMode: .fill)
          case .failure(let error):
            Text("Error: \(error.localizedDescription)")
          @unknown default:
            fatalError()
          }
        }

        // URL, scale, (AsyncImagePhase) -> Content (= some View)
        AsyncImage(url: url, scale: 2) { phase in
          switch phase {
          case .empty:
            Text("Empty")
          case .success(let image):
            image
              .resizable()
              .aspectRatio(contentMode: .fill)
          case .failure(let error):
            Text("Error: \(error.localizedDescription)")
          @unknown default:
            fatalError()
          }
        }

        // URL, scale, transaction(animation), (AsyncImagePhase) -> Content (= some View)
        AsyncImage(url: url, scale: 2, transaction: .init(animation: .easeInOut)) { phase in
          switch phase {
          case .empty:
            Text("Empty")
          case .success(let image):
            image
          case .failure(let error):
            Text("Error: \(error.localizedDescription)")
          @unknown default:
            fatalError()
          }
        }

        // URL, (Image) -> some View, placeholder: () -> some View
        AsyncImage(url: url) { image in
          image
            .resizable()
            .aspectRatio(contentMode: .fill)
        } placeholder: {
          Text("Placeholder")
        }

        // URL, scale, (Image) -> some View, placeholder: () -> some View
        AsyncImage(url: url, scale: 2) { image in
          image
            .resizable()
            .aspectRatio(contentMode: .fill)
        } placeholder: {
          Text("Placeholder")
        }
      }
    }
  }
}

struct AsyncImageView_Previews: PreviewProvider {
  static var previews: some View {
    AsyncImageView()
  }
}
