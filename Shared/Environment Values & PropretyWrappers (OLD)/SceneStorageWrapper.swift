//
//  SceneStorageWrapper.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import SwiftUI

/// @SceneStorage pour sauvegarder des datas propres à chaque scene
/// Disponible sur : i•Pad•OS / watchOS / tvOS / mac OS / Mac Catalyst
///
/// Comme un UserDefault pour chaque scene
/// C'est de la "state restoration", très important pour le multi-window sur iPadOS
///
/// Pas très solide (se baser sur des String à chaque fois peut mener à des erreurs)
/// Je propose donc quelques idées plus bas en extension

struct SceneStorageWrapper: View {

  // @SceneStorage classique
  @SceneStorage("TextField") var text = ""
  // @SceneStorage custom
  @SceneStorage(.textField) var textField

  var body: some View {
    NavigationView {
      VStack {
        TextField("Classique @SceneStorage", text: $text)
          .foregroundColor(.purple)
          .padding()
          .textFieldStyle(RoundedBorderTextFieldStyle())
        TextField("Custom solid @SceneStorage", text: $textField)
          .foregroundColor(.red)
          .padding()
          .textFieldStyle(RoundedBorderTextFieldStyle())
      }
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct SceneStorageWrapper_Previews: PreviewProvider {
  static var previews: some View {
    SceneStorageWrapper()
  }
}

// MARK: - Solid SceneStorage
extension SceneStorage where Value == String {
  fileprivate init(_ key: SceneStorageKey) {
    self.init(wrappedValue: "", key.rawValue)
  }
}

fileprivate enum SceneStorageKey: String {
  case textField
}
