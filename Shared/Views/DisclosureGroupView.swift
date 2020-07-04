//
//  DisclosureGroupView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 04/07/2020.
//

import SwiftUI

/// Apparition des DisclosureGroup qui permettent de montrer / cacher du contenu
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// Plusieurs constructeurs :
///   • DisclosureGroup(Title) { ... }
///   • DisclosureGroup(Title, isExpanded: *Binding* ) { ... }
/// - Constructeurs pour personnaliser chaque vue
///   • DisclosureGroup( content: { ... }, label: { ... })
///   • DisclosureGroup( isExpanded: *Binding*, content: { ... }, label: { ...})

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
      .accentColor(.red)
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
        .accentColor(.red)
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
