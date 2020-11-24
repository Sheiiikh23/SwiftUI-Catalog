//
//  TextCaseModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// textCase pour transformer une string en majuscule / minuscule ou la laisser telle quel
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOs / Mac Catalyst
///
/// TextCase présent nativement
///   • none : textCase de la String (par défaut)
///   • uppercase : majuscule
///   • lowercase : minuscule

// MARK: - Utilisation : Forcer le Text à être en majuscule, miniscule, ou "naturel"

struct TextCaseModifier: View {

  @State private var valueTextField = ""

    var body: some View {
      VStack(spacing: 50) {

        Text("No textCase !")
          .textCase(.none)

        TextField("Enter your name : ", text: $valueTextField)
          .textCase(.uppercase)
          .disableAutocorrection(true)
          .padding()
          .textFieldStyle(RoundedBorderTextFieldStyle())

        Text("EveryThing iS possiBLe when YOU are deterMINated")
          .font(.title3)
          .fontWeight(.bold)
          .padding()
          .background(Color.pink.opacity(0.5))
          .textCase(.lowercase)
      }
    }
}

struct TextCaseModifier_Previews: PreviewProvider {
    static var previews: some View {
        TextCaseModifier()
    }
}
