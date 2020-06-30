//
//  SignInWithappleButtonView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Apparition du boutton sign in with Apple en natif: SignInWithAppleButton
/// Disponible sur i•Pad•OS / tvOS / macOS / Mac Catalyst
///
/// Un seul constructeur prenant 3 paramètres :
///   • Label : .continue, .signIn, .signUp ––> change le label du button
///   • onRequest : some action
///   • onCompletion: some action
///
/// Pour voir plus en détail les onRequest et onCompletion cf doc : https://developer.apple.com/documentation/swiftui/signinwithapplebutton


struct SignInWithappleButtonView: View {
  var body: some View {
    VStack(spacing: 25) {

      /// Label continue
      SignInWithAppleButton(
        .continue,
        onRequest: {_ in }, /// Some action here
        onCompletion: {_ in } /// Some action here
      )
      .frame(width: 300, height: 200)

      /// Label signIn
      SignInWithAppleButton(
        .signIn,
        onRequest: {_ in }, /// Some action here
        onCompletion: {_ in } /// Some action here
      )
      .frame(width: 300, height: 200)

      /// Label signUp
      SignInWithAppleButton(
        .signUp,
        onRequest: {_ in }, /// Some action here
        onCompletion: {_ in } /// Some action here
      )
      .frame(width: 300, height: 200)
    }
  }
}

struct SignInWithappleButtonView_Previews: PreviewProvider {
  static var previews: some View {
    SignInWithappleButtonView()
  }
}
