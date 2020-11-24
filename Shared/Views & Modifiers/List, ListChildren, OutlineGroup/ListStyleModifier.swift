//
//  ListStyleModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// ListeStyle propre pour les List :
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// ListStyle présents nativement :
///   • DefaultListStyle : propre à chaque plateforme
///   • CarouselListStyle et EllipticalListStyle : cf watchOS
///   • GroupedListStyle : dispo sur i•Pad•OS / tvOS / Mac Catalyst
///     - Agit ± comme un padding vertical sur la List en elle-même
///   • InsetGroupedListStyle : dispo sur i•Pad•OS / Mac Catalyst
///     - Agit ± comme un padding vertical & horizontal sur la List en elle-même
///     - Utilisé dans Notes (et un peu partout dans iOS 14)
///   • InsetListStyle : dispo sur i•Pad•OS / macOS / Mac Catalyst
///     - Agit ± comme un padding horizontal sur le contenu de la List
///   • PlainListStyle : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///     - Aucune différence sur i•Pad•OS ?
///   • SideBarListStyle : i•Pad•OS / macOS / Mac Catalyst
///     - Grise le background et enlève le Divider de chaque élément
///     - Agit comme un padding
///     - Très recommandé pour les iPads

// MARK: - Utilisation : Provider une UI bien particulière pour une List en fonction d'un context donné

struct DefaultListStyleModifier: View {
  var body: some View {
    List(0...40, id: \.self) { item in
      HStack {
        Text("Hello row n°\(item)")
          .font(.title)
        Spacer()
        Image(systemName: "gear")
      }
    }
    .listStyle(DefaultListStyle())
  }
}

struct GroupedListStyleModifier: View {
  var body: some View {
    List(0...100, id: \.self) { item in
      HStack {
        Text("Hello row n°\(item)")
          .font(.title)
        Spacer()
        Image(systemName: "gear")
      }
    }
    .listStyle(GroupedListStyle())
  }
}

struct InsetGroupedListStyleModifier: View {
  var body: some View {
    List(0...100, id: \.self) { item in
      HStack {
        Text("Hello row n°\(item)")
          .font(.title)
        Spacer()
        Image(systemName: "gear")
      }
    }
    .listStyle(InsetGroupedListStyle())
  }
}

struct InsetListStyleModifier: View {
  var body: some View {
    List(0...100, id: \.self) { item in
      HStack {
        Text("Hello row n°\(item)")
          .font(.title)
        Spacer()
        Image(systemName: "gear")
      }
    }
    .listStyle(InsetListStyle())
  }
}

struct PlainListStyleModifier: View {
  var body: some View {
    List(0...100, id: \.self) { item in
      HStack {
        Text("Hello row n°\(item)")
          .font(.title)
        Spacer()
        Image(systemName: "gear")
      }
    }
    .listStyle(PlainListStyle())
  }
}

struct SidebarListStyleModifier: View {
  var body: some View {
    List(0...100, id: \.self) { item in
      HStack {
        Text("Hello row n°\(item)")
          .font(.title)
        Spacer()
        Image(systemName: "gear")
      }
    }
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
