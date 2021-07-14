//
//  SignInWithappleButtonView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI
import AuthenticationServices

/// SignInWithAppleButton permer d'afficher un boutton pour sign in with Apple pre-build 👍
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Obligé d'import AuthenticationServices
/// Paramètres :
///  • Label : définit le texte du bouton
///     - .continue : "Continue with Apple"
///     - .signIn : "Sign in with Apple"
///     - .signUp : "Sign up with Apple"
/// • onRequest : (ASAuthorizationAppleIDRequest) -> Void
/// • onCompletion: (Result<ASAuthorization, Error>) -> Void
///
/// Pour voir plus en détail les onRequest et onCompletion cf doc : https://developer.apple.com/documentation/swiftui/signinwithapplebutton

// MARK: - Utilisation : Button pré-build par Apple

struct SignInWithappleButtonView: View {
  var body: some View {
    VStack(spacing: 25) {

      /// Continue with Apple
      SignInWithAppleButton(.continue) { request in
        print(request)
      } onCompletion: { result in
        switch result {
        case .success(let authorization):
          print("Authorized – Some actions here : \(authorization)")
        case .failure(let error):
          print("Error – Some actions here : \(error.localizedDescription)")
        }
      }
      .padding()

      /// Sign in with Apple
      SignInWithAppleButton(.signIn) { request in
        print(request)
      } onCompletion: { result in
        switch result {
        case .success(let authorization):
          print("Authorized – Some actions here : \(authorization)")
        case .failure(let error):
          print("Error – Some actions here : \(error.localizedDescription)")
        }
      }
      .padding()

      /// Sign up with Apple
      SignInWithAppleButton(.signUp) { request in
        print(request)
      } onCompletion: { result in
        switch result {
        case .success(let authorization):
          print("Authorized – Some actions here : \(authorization)")
        case .failure(let error):
          print("Error – Some actions here : \(error.localizedDescription)")
        }
      }
      .padding()
    }
  }
}

struct SignInWithappleButtonView_Previews: PreviewProvider {
  static var previews: some View {
    SignInWithappleButtonView()
  }
}
