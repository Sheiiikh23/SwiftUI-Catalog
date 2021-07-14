//
//  DefaultAppStorageModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// DefaultAppStorage permet de spécifier le store par défaut des @AppStorage de la vue ou d'un container
/// Disponible sur : i•Pad•OS / watchOS / tvOS / MacOS / Mac Catalyst
///
/// À utiliser avec des @AppStorage mais peu d'utilité vu qu'on peut le set lors de la déclaration de cette variable

// MARK: - Utilisation : Avec des @AppStorage mais utilisation assez minime selon moi

struct DefaultAppStorageModifier: View {

  @AppStorage(.name) var name

  var body: some View {
    VStack {
      VStack {
        TextField("Enter your name", text: $name)
          .keyboardType(.default)
      }
      .defaultAppStorage(UserDefaults.init(suiteName: "user")!)
    }
  }
}

fileprivate extension AppStorage where Value == String {
  init(_ key: AppStorageKeys) {
    self.init(wrappedValue: "", key.rawValue)
  }
}

fileprivate enum AppStorageKeys: String {
  case name
}


