//
//  TextCaseModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Apparition du modifier textCase qui permet de forcer le Text / TextField en majuscule / minuscule
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOs / Mac Catalyst
///
/// TextCase présent nativement
///   • none ––> par défaut, textCase de la String
///   • uppercase ––> tout en majuscule
///   • lowercase ––> tout en minuscule


struct TextCaseModifier: View {

  @State private var valueTextField = ""

    var body: some View {
      VStack(spacing: 50) {

        /// Default TextCase
        Text("No textCase !")
          .textCase(.none)

        /// uppercase TextCase
        TextField("Enter your name : ", text: $valueTextField)
          .textCase(.uppercase)
          /// disableAutocorrection est un bon modifier a coupler textCase
          .disableAutocorrection(true)
          .padding()

        /// lowercase TextCase 
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
