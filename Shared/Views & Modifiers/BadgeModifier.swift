//
//  SwiftUIView.swift
//  iOS
//
//  Created by Lucas Abijmil on 09/06/2021.
//

import SwiftUI

/// `badge(_:)` permet d'ajouter un badge dans une TabBar ou un placeholder dans une List
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// Fonctionne uniquement après un `tabItem` ou dans une row d'une `List`

// MARK: - Utilisation : permet d'ajouter un badge sur un tabItem et un placeholder pour les rows d'une List

struct BadgeModifierWithTabView: View {
  var body: some View {
    TabView {
      Text("YO")
        .tabItem {
          Label("Home", systemImage: "house")
        }
        .badge(5)
    }
  }
}

struct BadgeModifierWithList: View {

  var body: some View {
    List {
      Text("WI-FI")
        .badge("My WI-FI")
      Text("Bluetooth")
        .badge("on")
      Text("Count")
        .badge(10)
    }
  }
}
