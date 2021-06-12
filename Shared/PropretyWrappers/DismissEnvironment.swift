//
//  DismissEnvironment.swift
//  iOS
//
//  Created by Lucas Abijmil on 12/06/2021.
//

import SwiftUI

/// dismiss est une environmentValue simplifiant l'environmentValue `presentationMode`
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// var dismiss: DismissAction { get }
/// DissmissAction est une structure qui contient :
///   - isPresented: Bool ––> dique si une vue est actuellement présenté
///   - callAsFunction() / dismiss() ––> Dismiss la vue si actuellement présentée

// MARK: - Utilisation : Permet de dismiss une View presénté au sein d'une NavigationView, Sheet etc..

struct DismissEnvironment: View {

  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    VStack {
      Text("Welcome to the detail View, click on the button below to go to the parent view")
      Button { dismiss() } label: {
        Text("Go back to the parent View")
      }
    }
  }
}

struct DismissContentEnvironmentView: View {

  var body: some View {
    NavigationView {
      NavigationLink(destination: DismissEnvironment()) {
        Text("Go to the details View")
      }
    }
  }
}

struct DismissEnvironment_Previews: PreviewProvider {
  static var previews: some View {
    DismissEnvironment()
  }
}
