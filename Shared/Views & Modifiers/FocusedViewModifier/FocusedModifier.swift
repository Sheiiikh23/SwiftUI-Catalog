//
//  Keyboard.swift
//  iOS
//
//  Created by Lucas Abijmil on 09/06/2021.
//

import SwiftUI

/// Focused modifie la View en liant son état de focus à la valeur d'état / d'état booléenne donnée.
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Plusieurs signatures :
///   - focused(_ condition: FocusState<Bool>.Binding) -> some View
///   - focused<Value>(_ binding: FocusState<Value>.Binding, equals value: Value) -> some View where Value : Hashable
///
/// S'utilise généralement avec une `@FocusState` var, et `.onSubmit
/// Très utile pour les TextField, SecureField, focus sur tvOS etc...

// MARK: - Utilisation : Forms, focus / dismiss du keyboard, focus sur tvOS

struct FocusedModifierBool: View {

  @State private var name = ""
  @FocusState private var nameIsFocused: Bool

  var body: some View {
    VStack {
      TextField("Enter your name", text: $name)
        .focused($nameIsFocused)

      Button("Submit") {
        nameIsFocused = false
      }
    }
  }
}


struct FocusedModifierValue: View {

  enum Field {
    case firstName
    case lastName
    case emailAddress
  }

  @State private var firstName = ""
  @State private var lastName = ""
  @State private var emailAdress = ""
  @FocusState private var focusField: Field? // Optionnel car onAppear, l'utilisateur ne focus rien

  var body: some View {
    VStack {
      TextField("Enter your first name", text: $firstName)
        .focused($focusField, equals: .firstName)
        .textContentType(.givenName)
        .submitLabel(.next)

      TextField("Enter your last name", text: $lastName)
        .focused($focusField, equals: .lastName)
        .textContentType(.familyName)
        .submitLabel(.next)

      TextField("Enter your email adress", text: $emailAdress)
        .focused($focusField, equals: .emailAddress)
        .textContentType(.emailAddress)
        .submitLabel(.join)
    }
    .onSubmit {
      switch focusField {
      case .firstName:
        focusField = .lastName
      case .lastName:
        focusField = .emailAddress
      default:
        print("joining chat room...")
      }
    }
  }
}

struct Keyboard_Previews: PreviewProvider {
  static var previews: some View {
    FocusedModifierBool()
    FocusedModifierValue()
  }
}
