//
//  CustomRedacted.swift
//  iOS
//
//  Created by Lucas Abijmil on 03/12/2020.
//

import SwiftUI

// MARK: - Création de customs RedactionsReasons
enum RedactionReasonsCustom {
  case overlay(Color)
  case blurred(CGFloat)
}

// MARK: - Création de chaque ViewModifier (= .redacted) correspondant à chaque cas de RedactionReasons custom
struct Confidential: ViewModifier {

  let color: Color

  func body(content: Content) -> some View {
    content
      .accessibility(label: Text("Confidential"))
      .overlay(color)
  }
}

struct Blurred: ViewModifier {

  let radius: CGFloat

  func body(content: Content) -> some View {
    content
      .accessibility(label: Text("Blurred"))
      .blur(radius: radius)
  }
}

// MARK: - Création d'un ViewModifier qui appliquera le bon ViewModifier en fonction de la custom RedactionReasons
struct Redactable: ViewModifier {

  let reason: RedactionReasonsCustom

  @ViewBuilder
  func body(content: Content) -> some View {
    switch reason {
    case .overlay(let color):
      content
        .modifier(Confidential(color: color))
    case .blurred(let radius):
      content
        .modifier(Blurred(radius: radius))
    }
  }
}

// MARK: - Extension pour ajouter la fonction à View
extension View {
  func redacted(reason: RedactionReasonsCustom) -> some View {
    self
      .modifier(Redactable(reason: reason))
  }
}

// MARK: - Exemple
struct CustomRedacted: View {
  var body: some View {
    VStack(spacing: 90) {
      VStack(spacing: 20) {
        Text("Placeholder RedactedReason (native)")
          .font(.title3)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
        BookmarkView()
          .redacted(reason: .placeholder)
      }
      VStack(spacing: 20) {
        Text("Overlay RedactedReason (custom)")
          .font(.title3)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
        BookmarkView()
          .redacted(reason: .overlay(.red))
      }
      VStack(spacing: 20) {
        Text("Blurred RedactedReason (custom)")
          .font(.title3)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
        BookmarkView()
          .redacted(reason: .blurred(5))
      }
    }
  }
}

fileprivate struct BookmarkView: View {
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 8) {
        Text("Bookmarker un episode")
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(.blue)

        Text("Beaucoup de texte mais genre vraiment")
          .font(.subheadline)
          .fontWeight(.semibold)
      }
      Spacer()
      Image(systemName: "bookmark.fill")
        .renderingMode(.original)
        .font(.system(size: 36, weight: .bold))
    }
    .padding(.horizontal)
  }
}

struct CustomRedacted_Previews: PreviewProvider {
  static var previews: some View {
    CustomRedacted()
  }
}
