//
//  SwiftUIView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 10/06/2021.
//

import SwiftUI

/// `alert` permet de créer une alerte dont le layout est automatiquement géré par SwiftUI
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Nouvelles APIs :
///   - func alert<S, A, M, T>(_ title: S, isPresented: Binding<Bool>, presenting data: T?, actions: (T) -> A, message: (T) -> M) -> some View where S : StringProtocol, A : View, M : View
///   - func alert<S, A, M>(_ title: S, isPresented: Binding<Bool>, actions: () -> A, message: () -> M) -> some View where S : StringProtocol, A : View, M : View
///   - func alert<A, M>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, actions: () -> A, message: () -> M) -> some View where A : View, M : View
///   - func alert<A, M>(_ title: Text, isPresented: Binding<Bool>, actions: () -> A, message: () -> M) -> some View where A : View, M : View
///   - func alert<A, M, T>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, presenting data: T?, actions: (T) -> A, message: (T) -> M) -> some View where A : View, M : View

#warning("TO DO : faire un exemple pour chaque API")

struct AlertModifier: View {

  @State private var showAlert = false

  var body: some View {
    Button {showAlert.toggle() } label: {
      Text("Show alert")
    }
    .alert("Important message !", isPresented: $showAlert) {
      Button(role: .cancel) { } label: { Text("One") }
        Button(role: .destructive) { } label: { Text("Second") }
//        Button { } label: { Text("Third") }
    }
    
  }
}

struct AlertModifier_Preview: PreviewProvider {
  static var previews: some View {
    AlertModifier()
  }
}
