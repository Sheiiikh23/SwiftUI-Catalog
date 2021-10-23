//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : watchOS 7.0, tvOS 14.0, macOS 12.0
/// Description : Une action qui demande au système de focus de réévaluer le focus par défaut
///
/// Définition de l'`EnvironmentValue` :
///   - var resetFocus: ResetFocusAction { get }
///
/// Remarques :
///   - resetFocus s'utilise via une fonction `callAsFunction` qui peut être appellé depuis la propriété
///   - Doit s'utiliser dans un `@Namespace`
///   - S'accompage généralement des modifiers `prefersDefaultFocus(_:, in:_)` et `focusScope(_:)`
///   - Lien intéressant : https://swiftwithmajid.com/2020/12/02/focus-management-in-swiftui/

struct ResetFocus: View {

  @Environment(\.resetFocus) var resetFocus
  @State private var email = ""
  @State private var password = ""
  @State private var hasFilledCredentials = false
  @Namespace private var namespace

  var body: some View {
    VStack {
      TextField("E-mail", text: $email)
        .prefersDefaultFocus(!hasFilledCredentials, in: namespace)
      SecureField("Password", text: $password)
      Button("Login") { }
      .prefersDefaultFocus(hasFilledCredentials, in: namespace)
      Button("Reset credential") {
        hasFilledCredentials = false
        resetFocus(in: namespace)
      }
    }
    .focusScope(namespace)
  }
}

struct ResetFocus_Previews: PreviewProvider {
  static var previews: some View {
    ResetFocus()
  }
}
