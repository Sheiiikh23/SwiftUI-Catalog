//
//  AppStorageWrapper.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import SwiftUI

/// Apparition d'un nouveau proprety wrapper: @AppStorage qui est le "userDefault"
/// Disponible sur : i•Pad•OS / watchOS / tvOS / MacOS / Mac Catalyst
///
/// Permets de lire et écrire des datas dans le standard userDefault
/// Le wrapper permet également de créer d'autre classe dans le userDefault
///   • ajout du paramètre store: UserDefault(suiteName: String)

struct AppStorageWrapper: View {

  @AppStorage("username") var username = "Anonymous"
  @AppStorage("username", store: UserDefaults(suiteName: "group")) var usernameGroup = "Anonymous"

    var body: some View {
      VStack(spacing: 50) {
        Text("Welcome \(username) standard UserDefault")
          .font(.title3)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
          .foregroundColor(.red)
          .padding()
          .background(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
          .cornerRadius(15)
          .shadow(radius: 15)
        Button {
          username = "@lucas_abijmil"
          /// Pareil que
          ///UserDefaults.standard.setValue("@lucas_abijmil", forKey: "username")

        } label: {
          Text("Log in for UserDefault standard")
        }
        Text("Welvome \(usernameGroup) group UserDefault")
          .font(.title3)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
          .foregroundColor(.red)
          .padding()
          .background(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
          .cornerRadius(15)
          .shadow(radius: 15)

        Button {
          usernameGroup = "@lucasIOSDev"
          /// Pareil que
//          UserDefaults(suiteName: "group")?.setValue("@lucasIOSDev", forKey: "usernameGroup")

        } label: {
          Text("Log in for group UserDefault")
      }
    }
    }
}

struct AppStorageWrapper_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageWrapper()
    }
}
