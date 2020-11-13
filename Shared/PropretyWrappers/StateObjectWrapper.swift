//
//  StateObjectWrapper.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import SwiftUI

/// StateObject pour créer une référence d'une class conforme à ObservableObject
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Cataclyst
///
/// StateObject = "source of truth"
///
/// Permet lorsque la View se reconstruit de garder cet objet en mémoire et de ne pas recréer un nouvel objet (supprimant les modifications)
/// Permet également de s'assurer que la référence sera créer avant le body de la View
/// 
///
/// Lorsqu'on passe cet objet à une autre struct alors cette dernière doit donc utiliser @ObservedObject var
///
/// On peut bien sûr l'injecter dans l'environment de l'application (cf SwiftUI_2_0App)

// MARK: - Utilisation : Création de référence pour une class conforme au protocol ObservableObject

class UserViewModel: ObservableObject {
  @Published var username = "@lucas_abijmil"
}

struct StateObjectWrapper: View {

  /// Ancienne manière
  // @ObservedObject var user = UserViewModel()

  /// Nouvelle manière
  @StateObject var user = UserViewModel()
  @State private var showModal = false

    var body: some View {
      VStack(spacing: 30) {
        Text("username: \(user.username)")
          .font(.title)
          .fontWeight(.bold)
          .padding(.horizontal, 20)
          .padding(.vertical)
          .background(Color.pink.opacity(0.75))
          .cornerRadius(30)
        Button { showModal.toggle() } label: {
          Text("Change my name")
        }
      }
      .sheet(isPresented: $showModal) {
        AnotherView(user: user)
      }
    }
}

struct AnotherView: View {

  @ObservedObject var user: UserViewModel

  var body: some View {
    TextField("New Name", text: $user.username)
      .disableAutocorrection(true)
      .textFieldStyle(RoundedBorderTextFieldStyle())
      .padding()
  }
}
struct StateObjectWrapper_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectWrapper()
    }
}
