//
//  ListStyleModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// Nouveau ListeStyle propre pour les List :
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// ListStyle présents nativement (cf. watchExtension) :
///   • DefaultListStyle ––> par défaut pour i•Pad•Os / tvOS / macOS / Mac Catalyst
///   • GroupedListStyle ––> uniquement pour i•Pad•Os / tvOS / Mac Catalyst
///   • InsetGroupedListStyle ––> uniquement pour i•Pad•OS / Mac Catalyst
///   • InsetListStyle ––> uniquement pour i•Pad•OS / macOS / Mac Catalyst
///   • PlainListStyle ––> i•Pad•OS / tvOS / macOS / Mac Catalyst
///   • SideBarListStyle ––> i•Pad•OS / macOS / Mac Catalyst

struct DefaultListStyleModifier: View {
  var body: some View {
    List(0...40, id: \.self) { item in
      Text("Hello row n°\(item)")
        .font(.title)
    }
    /// Activer / désactiver ce modifier ne provoquera aucun changement
    .listStyle(DefaultListStyle())
  }
}

struct GroupedListStyleModifier: View {
  var body: some View {
    List(0...100, id: \.self) { item in
      Text("Hello row n°\(item)")
        .font(.title)
    }
    /// Agit ± comme un padding vertical sur la View en elle-même
    .listStyle(GroupedListStyle())
  }
}

struct InsetGroupedListStyleModifier: View {
  var body: some View {
    List(0...100, id: \.self) { item in
      Text("Hello row n°\(item)")
        .font(.title)
    }
    /// Agit ± comme un padding vertical & horizontal sur la View en elle-même
    .listStyle(InsetGroupedListStyle())
  }
}

struct InsetListStyleModifier: View {
  var body: some View {
    List(0...100, id: \.self) { item in
      Text("Hello row n°\(item)")
        .font(.title)
    }
    /// Agit ± comme un padding horizontal sur le contenu de la List
    .listStyle(InsetListStyle())
  }
}

struct PlainListStyleModifier: View {
  var body: some View {
    List(0...100, id: \.self) { item in
      Text("Hello row n°\(item)")
        .font(.title)
    }
    /// Aucune différence sur i•Pad•OS
    .listStyle(PlainListStyle())
  }
}

struct SidebarListStyleModifier: View {
  var body: some View {
    List(0...10, id: \.self) { item in
      Text("Hello row n°\(item)")
        .font(.title)
    }
    /// Grise le background et enlève le Divider de chaque élément
    /// Agit comme un padding
    .listStyle(SidebarListStyle())
  }
}


struct ListStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DefaultListStyleModifier()
      GroupedListStyleModifier()
      InsetGroupedListStyleModifier()
      InsetListStyleModifier()
      PlainListStyleModifier()
      SidebarListStyleModifier()
    }
  }
}
