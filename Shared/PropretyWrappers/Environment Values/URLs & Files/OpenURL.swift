//
//  OpenURL.swift
//  iOS
//
//  Created by Lucas Abijmil on 01/12/2020.
//

import SwiftUI

/// openURL permet d'ouvrir une URL avec le navigateur par défaut de l'utilisateur (Chrome, Safari... dispo depuis iOS 14)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// openURL: OpenURLAction { get }
/// OpenURLAction met à disposition deux fonctions :
///   • callAsFunction(_ url: URL)
///   • callAsFunction(_ url: URL, comletion: (Bool) -> Void)
///

// MARK: - Importance pour l'accessibilité : très faible – faible
// MARK: - Utilisation : Parfait pour ouvrir des URLs tout en respectant les préférences de l'utilisateur

struct OpenURL: View {

  @Environment(\.openURL) var openURL

  var body: some View {
    VStack {
      Button { showGoogleWithoutCompletion() } label: {
        Text("Show Google according to the user preferences without completion")
          .font(.subheadline)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
          .foregroundColor(.white)
          .padding(.horizontal, 20)
          .padding(.vertical)
          .background(Color.red.opacity(0.33))
          .cornerRadius(20)
      }
      Button { showGoogleWithCompletion() } label: {
        Text("Show Google according to the user preferences with completion")
          .font(.subheadline)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
          .foregroundColor(.white)
          .padding(.horizontal, 20)
          .padding(.vertical)
          .background(Color.green.opacity(0.33))
          .cornerRadius(20)
      }
    }
  }
  private func showGoogleWithoutCompletion() {
    guard let url = URL(string: "https://www.google.com") else { return }
    openURL.callAsFunction(url)
  }
  private func showGoogleWithCompletion() {
    guard let url = URL(string: "https://www.google.com") else { return }
    openURL.callAsFunction(url) { isSucceed in
      if isSucceed {
        print("User is on the Internet")
      } else {
        print("User isn't on the Internet")
      }
    }
  }
}

struct OpenURL_Previews: PreviewProvider {
  static var previews: some View {
    OpenURL()
  }
}
