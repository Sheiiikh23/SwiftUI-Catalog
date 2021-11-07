//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Property wrapper qui permet de lire et d'écrire dans les `UserDefaults` standard ou un groupe particulier
///
/// 3 types d'init pour un `@AppStorage` :
///   - init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) où la Value peut être :
///     - String
///     - RawRepresentable where Value.RawValue == Int ou Value.RawValue == String
///     - Data
///     - Int
///     - URL
///     - Double
///     - Bool
///   - init(_ key: String, store: UserDefaults? = nil) où la Value peut être :
///     - Int?
///     - String?
///     - Double?
///     - Data?
///     - Bool?
///     - URL?
///   - init<R>(_ key: String, store: UserDefaults? = nil) where Value == Optional<R>, R : RawRepresentable, R.RawValue == Int ou R.RawValue == String
///
/// Paramètres :
///   - wrappedValue: Value ––> la valeur par défaut s'il n'y a pas de valeur pour cette clé
///   - key: `String` ––> la clé pour lire et écrire dans le `UserDefaults`
///   - store: `UserDefaults?` = nil ––> le groupe de `UserDefaults` à utiliser. Si nil, alors groupe standard. Nil par défaut
///
/// Remarques :
///   - Dès que la valeur est changée, la nouvelle valeur est set dans les `UserDefaults` et le body est réinvoqué
///   - `UserDefaults` n'est pas un stockage sécurisé, il ne faut pas y enrigstrer des données personnelles
///   - Pour plus d'info sur les `UserDefaults` voir https://developer.apple.com/documentation/foundation/userdefaults

struct AppStorageWrapper: View {

  /// init : wrappedValue: "Anonymous", key: "name", store: nil
  @AppStorage(wrappedValue: "Anonymous", "name") private var name

  /// init : wrappedValue: "Anonymous", key: "name", store: user
  @AppStorage(wrappedValue: "Anonymous", "name", store: UserDefaults(suiteName: "user")) private var userName

  /// init : key: "nickname", store: nil
  @AppStorage("nickname") private var nickname: String?

  /// init : key: "nickname", store: user
  @AppStorage("nickname", store: UserDefaults(suiteName: "user")) private var userNickname: String?

  @State private var nicknameString = ""
  @State private var userNicknameString = ""

  var body: some View {
    VStack(spacing: 10) {
      VStack {
        Text("Name in standard group is : \(name)")
        Text("Name in user group is : \(userName)")
      }
      VStack {
        TextField("Name in standard group", text: $name, prompt: Text(name))
        Divider()
        TextField("Name in user group", text: $userName, prompt: Text(userName))
      }
      VStack {
        Text("Nickname in standard group is : \(nickname ?? "none")")
        Text("Nickname in user group is : \(userNickname ?? "none")")
      }
      VStack {
        TextField("Nickname in standard group", text: $nicknameString, prompt: Text(nickname ?? "none"))
        Divider()
        TextField("Nickname in user group", text: $userNicknameString, prompt: Text(userNickname ?? "none"))
      }
    }
    .padding(.horizontal)
    .textFieldStyle(.roundedBorder)
    .onSubmit {
      nickname = nicknameString
      userNickname = userNicknameString
    }
  }
}

struct AppStorageWrapper_Previews: PreviewProvider {
  static var previews: some View {
    AppStorageWrapper()
  }
}

// MARK: - Rendre AppStorage un peu plus solide notamment sur les clés et stores
extension AppStorage where Value == String {
  init(wrappedValue: String, _ key: AppStorageKey, store: AppStorageStore? = nil) {
    if let store = store {
      self.init(wrappedValue: wrappedValue, key.rawValue, store: UserDefaults(suiteName: store.rawValue))
    } else {
      self.init(wrappedValue: wrappedValue, key.rawValue, store: nil)
    }
  }
}

extension AppStorage where Value == String? {
  init(_ key: AppStorageKey, store: AppStorageStore? = nil) {
    if let store = store {
      self.init(key.rawValue, store: UserDefaults(suiteName: store.rawValue))
    } else {
      self.init(key.rawValue, store: nil)
    }
  }
}

enum AppStorageKey: String {
  case name
  case nickname
}

enum AppStorageStore: String {
  case user
}

struct AppStorageWrapperCustom: View {

  @AppStorage(wrappedValue: "Anonymous", .name) private var name
  @AppStorage(wrappedValue: "Anonymous", .name, store: .user) private var userName
  @AppStorage(.nickname) private var nickname
  @AppStorage(.nickname, store: .user) private var userNickname

  @State private var nicknameString = ""
  @State private var userNicknameString = ""

  var body: some View {
    VStack(spacing: 10) {
      VStack {
        Text("Name in standard group is : \(name)")
        Text("Name in user group is : \(userName)")
      }
      VStack {
        TextField("Name in standard group", text: $name, prompt: Text(name))
        Divider()
        TextField("Name in user group", text: $userName, prompt: Text(userName))
      }
      VStack {
        Text("Nickname in standard group is : \(nickname ?? "none")")
        Text("Nickname in user group is : \(userNickname ?? "none")")
      }
      VStack {
        TextField("Nickname in standard group", text: $nicknameString, prompt: Text(nickname ?? "none"))
        Divider()
        TextField("Nickname in user group", text: $userNicknameString, prompt: Text(userNickname ?? "none"))
      }
    }
    .padding(.horizontal)
    .textFieldStyle(.roundedBorder)
    .onSubmit {
      nickname = nicknameString
      userNickname = userNicknameString
    }
  }
}

struct AppStorageWrapperCustom_Previews: PreviewProvider {
  static var previews: some View {
    AppStorageWrapperCustom()
  }
}
