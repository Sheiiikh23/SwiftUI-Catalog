//
//  DisclosureGroupView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 04/07/2020.
//

import SwiftUI

/// DisclosureGroup qui permettent de montrer / cacher un groupe de View (DropwDown)
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// Permet de créer un DropDown menu avec un Title / View en fonction (ou non) d'un Binding
/// Animation native lorsque non utilisation d'un Binding
/// Rajouter un withAnimation lorsque utilisation d'un Binding

// MARK: - Utilisation : Créer des DropDown menu sans notion d'arbre de données

struct DisclosureGroupView: View {

  @State private var open = false
  @State private var open2 = false

  var body: some View {
    VStack {

      /// DisclosureGroup avec une String en tant que Title
      DisclosureGroup("Conditions générales de ventes") {
        /// Contenu de la Disclosure groupe
        Text("Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions.")
          .font(.caption)
          .foregroundColor(.blue)
          .fontWeight(.semibold)
      }
      .font(.title3)
      .accentColor(.red)
      .padding()

      /// DisclosureGroup avec un Binding et une String en tant que Title
      /// Permet de montrer / cacher le contenue en fonction de l'état du binding
      DisclosureGroup("Condition général d'utilisation", isExpanded: $open) {
        Text("Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions.")
          .font(.caption)
          .foregroundColor(.blue)
          .fontWeight(.semibold)
      }
      .font(.title3)
      .accentColor(.green)
      .padding()

      /// DisclosureGroup avec une View en tant que Label
      /// Plus personnalisable
      DisclosureGroup {
        Text("Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions.")
          .font(.caption)
          .foregroundColor(.blue)
          .fontWeight(.semibold)
      } label: {
        Text("Conditions générales de l'application")
          .font(.subheadline)
          .fontWeight(.semibold)
          .underline()
          .textCase(.uppercase)
      }
      .accentColor(.purple)
      .padding()

      /// DisclosureGroup avec une Binding et une View en tant que Label
      /// Plus personnalisable
      DisclosureGroup(isExpanded: $open2) {
          Text("Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions.")
            .font(.caption)
            .foregroundColor(.blue)
            .fontWeight(.semibold)
        } label: {
          Text("Conditions générales d'Apple")
            .font(.title3)
            .fontWeight(.semibold)
            .padding(.horizontal, 20)
            .padding(.vertical)
            .background(Color.pink.opacity(0.25))
            .cornerRadius(25)
        }
        .accentColor(.blue)
        .padding()

      Spacer()
    }
  }
}

struct DisclosureGroupView_Previews: PreviewProvider {
  static var previews: some View {
    DisclosureGroupView()
  }
}
