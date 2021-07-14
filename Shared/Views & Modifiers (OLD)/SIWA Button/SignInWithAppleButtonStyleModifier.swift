//
//  SignInWithAppleButtonStyleModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI
import AuthenticationServices

/// Modifier SignInWithAppleButtonStyle propre pour le SIWA (Sign In With Apple)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Trois SignInWithAppleButtonStyle natifs :
///   • black : background noir, Text blanc
///   • white : background blanc, Text noir
///   • whiteOutline : background blanc, Text noir, bordure noir

// MARK: - Utilisation : Custom la UI de SignInWithAppleButton View

struct SignInWithAppleButtonStyleModifier: View {
  var body: some View {
    VStack(spacing: 25) {

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
      .signInWithAppleButtonStyle(.black)

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
      .signInWithAppleButtonStyle(.white)

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
      .signInWithAppleButtonStyle(.whiteOutline)
    }
  }
}

struct SignInWithAppleButtonStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    SignInWithAppleButtonStyleModifier()
  }
}

