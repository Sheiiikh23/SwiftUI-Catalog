//
//  DisclosureGroupView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 04/07/2020.
//

import SwiftUI

/// Apparition des DisclosureGroup qui permettent de montrer / cacher un groupe de View (DropwDown)
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// Permet de créer un DropDown menu avec un label en fonction (ou non) d'un Binding
///
/// Plusieurs constructeurs :
///   • DisclosureGroup(Title) { ... }
///   • DisclosureGroup(Title, isExpanded: *Binding* ) { ... }
/// - Constructeurs pour personnaliser chaque vue
///   • DisclosureGroup( content: { ... }, label: { ... })
///   • DisclosureGroup( isExpanded: *Binding*, content: { ... }, label: { ...})

// MARK: - Utilisation : Créer des DropDown menu sans notion d'arbre de données

struct DisclosureGroupView: View {

  @State private var open = false

  var body: some View {
    VStack {
      DisclosureGroup("Conditions générales de ventes") {
        Text("Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions.")
          .font(.caption)
          .foregroundColor(.blue)
          .fontWeight(.semibold)
      }
      .font(.title3)
      .accentColor(.red)
      .padding()

      DisclosureGroup("Condition général d'utilisation", isExpanded: $open) {
        Text("Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions.")
          .font(.caption)
          .foregroundColor(.blue)
          .fontWeight(.semibold)
      }
      .font(.title3)
      .accentColor(.green)
      .padding()

      DisclosureGroup(
        isExpanded: $open,
        content: {
          Text("Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions. Beaucoup trop de text dans ces conditions.")
            .font(.caption)
            .foregroundColor(.blue)
            .fontWeight(.semibold)
        }, label: {
          Text("Conditions générales d'Apple")
            .font(.title3)
            .fontWeight(.semibold)
        })
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
