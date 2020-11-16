//
//  AppStorageWrapper.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import SwiftUI

/// @AppStorage qui est le wrapper pour les UserDefaults
/// Disponible sur : i•Pad•OS / watchOS / tvOS / MacOS / Mac Catalyst
///
/// Permets de lire et écrire des datas dans le UserDefaults (standard ou dans un groupe)
///
/// Le wrapper permet également de créer d'autre groupe dans le UserDefaults
///   • ajout du paramètre store: UserDefaults(suiteName: String)
///
/// Pas très solide (se baser sur des String à chaque fois peut mener à des erreurs, pareil pour le suiteName du UserDefaults)
/// Je propose donc quelques idées plus bas en extension

// MARK: - Utilisation : pour stocker en mémoire des données de petites taills non sensibles

struct AppStorageWrapper: View {

  // @AppStorage classique
  @AppStorage("username") var username = "Anonymous"
  @AppStorage("username", store: UserDefaults(suiteName: "instagram")) var usernameGroup = "Anonymous"

  // @AppStorage with standard UserDefaults custom
  @AppStorage(.firstName) var firstName
  // @AppStorage with group UserDefaults custom
  @AppStorage(.lastName, store: .swiftui) var lastName

  var body: some View {
    VStack(spacing: 50) {
      VStack(spacing: 15) {
        Text("App Storage not custom")
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(.red)
          .padding(.horizontal, 20)
          .padding(.vertical)
          .background(Color.green.opacity(0.5))
          .cornerRadius(30)
        Text("Welcome to \(username) in standard UserDefault")
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
          .foregroundColor(.red)
        Button {
          // UserDefaults.standard.setValue("@lucas_abijmil", forKey: "username")
          username = "@lucas_abijmil"
        } label: {
          Text("Change Anonymous for @lucas_abijmil")
        }
        Text("Welcome to \(usernameGroup) in instagram UserDefault")
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
          .foregroundColor(.red)
        Button {
          // UserDefaults(suiteName: "group")?.setValue("@lucasIOSDev", forKey: "usernameGroup")
          usernameGroup = "@lucasIOSDev"
        } label: {
          Text("Change Anonymous for @lucasIOSDev")
        }
      }
      Divider()
        .padding()
      VStack(spacing: 15) {
        Text("App Storage custom")
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(.red)
          .padding(.horizontal, 20)
          .padding(.vertical)
          .background(Color.green.opacity(0.5))
          .cornerRadius(30)
        // On aurait pu faire aussi un if let pour ne pas affiché lorsque firstName == nil
        Text("Welcome to \(firstName ?? "Uknown") in standard UserDefault")
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
          .foregroundColor(.red)
        Button { firstName = "Lucas" } label: { Text("Change Uknown for Lucas") }
        // On aurait pu faire aussi un if let pour ne pas affiché lorsque lastName == nil
        Text("Welcome to \(lastName ?? "Uknown") in instagram UserDefault")
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
          .foregroundColor(.red)
        Button { lastName = "Abijmil" } label: { Text("Change Uknown for Abijmil") }
      }
    }
  }
}

// MARK: - Solid AppStorage with standard UserDefaults (uniquement pour les String ici)
extension AppStorage where Value == String? {
  init(_ key: AppStorageKey) {
    self.init(key.rawValue)
  }
}


// MARK: - Solid AppStorage with group UserDefaults (uniquement pour les String ici)
extension AppStorage where Value == String? {

  init(_ key: AppStorageKey, store: AppStorageStore) {
    self.init(key.rawValue, store: UserDefaults(suiteName: store.rawValue))
  }
}

enum AppStorageKey: String {
  case firstName
  case lastName
}

enum AppStorageStore: String {
  case swiftui
}

struct AppStorageWrapper_Previews: PreviewProvider {
  static var previews: some View {
    AppStorageWrapper()
  }
}
