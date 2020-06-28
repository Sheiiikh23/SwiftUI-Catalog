//
//  SignInWithAppleButtonStyleModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Modifier SignInWithAppleButtonStyle propre pour le signInWithAppleButton
/// Disponible sur : i•Pad•OS / tvOS / macOS / Mac Catalyst
///
/// Trois SignInWithAppleButtonStyle natifs :
///   • black : background noir, Text blanc
///   • white : background blanc, Text noir
///   • whiteOutline : background blanc, Text noir, bordure noir

struct SignInWithAppleButtonStyleModifier: View {
  var body: some View {
    VStack(spacing: 25) {

      /// Label continue
      SignInWithAppleButton(
        .continue,
        onRequest: {_ in }, /// Somme action here
        onCompletion: {_ in } /// Somme action here
      )
      .frame(width: 300, height: 200)
      .signInWithAppleButtonStyle(.black)

      /// Label signIn
      SignInWithAppleButton(
        .signIn,
        onRequest: {_ in }, /// Somme action here
        onCompletion: {_ in } /// Somme action here
      )
      .frame(width: 300, height: 200)
      .signInWithAppleButtonStyle(.white)

      /// Label signUp
      SignInWithAppleButton(
        .signUp,
        onRequest: {_ in }, /// Somme action here
        onCompletion: {_ in } /// Somme action here
      )
      .frame(width: 300, height: 200)
      .signInWithAppleButtonStyle(.whiteOutline)
    }
  }
}

#warning("TODO")
/// Essayer de créer un CustomSignInWithAppleButtonStyle
///

//struct CustomSignInWithAppleButtonStyle: SignInWithAppleButton.Style {
//  func 
//}

struct SignInWithAppleButtonStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    SignInWithAppleButtonStyleModifier()
  }
}
