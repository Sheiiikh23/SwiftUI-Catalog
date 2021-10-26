//
//  OnSubmitModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 09/06/2021.
//

import SwiftUI

/// OnSubmit permet d'effectuer une action lorsque l'utilisateur soumet une valeur à cette View (TextField etc...)
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// S'utilise généralement avec une `@FocusState` var et `focused`

// MARK: - Utilisation : Permet d'effectuer une action lorsque l'état d'un @FocusState change

struct OnSubmitModifier: View {

  enum Field {
    case firstName
    case lastName
    case emailAddress
  }

  @State private var firstName = ""
  @State private var lastName = ""
  @State private var emailAdress = ""
  @FocusState private var focusField: Field?

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

struct OnSubmitModifier_Previews: PreviewProvider {
  static var previews: some View {
    OnSubmitModifier()
  }
}
