//
//  FocusStateWrapper.swift
//  iOS
//
//  Created by Lucas Abijmil on 09/06/2021.
//

import SwiftUI

/// @FocusState est un wrapper qui permet de lire et écrire une valeur afin de mettre à jour le placement du focus dans la View
/// Disponible sur : i•Pad•OS / watchOS / tvOS / MacOS / Mac Catalyst
///
/// S'utilise avec `focused(_:equals:)` and `focused(_:)`, optionnelement avec `onSubmit`

// MARK: - Utilisation : Permet d'upate une valeur et le focus dans la View

struct FocusStateWrapper: View {

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


struct FocusStateWrapperCustom: View {

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

struct FocusStateWrapper_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      FocusStateWrapper()
      FocusStateWrapperCustom()
    }
  }
}
