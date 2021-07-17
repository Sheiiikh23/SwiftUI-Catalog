//
//  ColoredSFSymbolsView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// SF Symbols en couleur + nouveaux SF Symbols (version 2)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
/// 
/// Utilisation du modifier : renderingMode(.original) pour appliquer les couleurs choisis par Apple

// MARK: - Utilisation : SF Symbols colorés natifs


/// Nouveauté : avant il fallait hardacoder pour avoir les SFSymbols en fill, désormais c'est SwiftUI qui décide en fonction du context il suffit donc juste de provide le SFSybmol
/// Par exemple une TabView sur iOS les SFSymbols sont fill tandis que sur macOS ils sont outlines

#warning("FIXME – TO DO")

struct SFsymnbolsContext: View {

  var body: some View {
    TabView {
      Color.yellow
        .tabItem { Label("Cards", systemImage: "rectangle.portrait.on.rectangle.portrait") }
      Color.mint
        .tabItem { Label("Rules", systemImage: "character.book.closed") }
      Color.red
        .tabItem { Label("Profile", systemImage: "person.circle") }
      Color.green
        .tabItem { Label("Magic", systemImage: "sparkles") }
    }
  }

}

struct ColoredSFSymbolsView: View {
  var body: some View {
    VStack(spacing: 50) {
      
      Image(systemName: "drop.triangle.fill")
        .renderingMode(.original)
        .font(.system(size: 40, weight: .bold))
        .padding()
        .background(Color.black)
        .clipShape(Circle())

      Image(systemName: "trash.circle.fill")
        .renderingMode(.original)
        .font(.system(size: 35, weight: .black))
        .imageScale(.large)
        .padding()
        .background(Color.black)
        .clipShape(Circle())

      Image(systemName: "cloud.sun.bolt.fill")
        .renderingMode(.original)
        .font(.system(size: 60, weight: .bold))
        .padding()
        .background(Color.black)
        .clipShape(Circle())
    }
  }
}

struct ColoredSFSymbolsView_Previews: PreviewProvider {
  static var previews: some View {
    ColoredSFSymbolsView()
  }
}


// MARK: - New SF Sybol explanation
/// Par défaut les SF Sybmol sont dans leur version `outlined`
/// Lorsqu'on souhaite rendre un symbole plus important, pour leur remplir d'une couleur par exemple, la version `fill` du SF Symbol est un excellent choix
///
/// Un SF Symbol peut avoir plein de style différent :
///   - `outlined` ––> comportement par défaut, à utiliser lorsqu'à côté d'un text
///   - `fill` ––> pour accentuer une action
///   - `slash` ––> pour une fonction de supprimer ou rendre inactif quelque chose
///   - `enclosing` ––> qui sont contenu dans une shape comme un circle, rectangle etc...
///  👉 Pour cela on utilise le modifier `symbolVariant(_:)` si iOS 15 autrement dans le choix du SF Symbol (.fill, .slash, etc...)
///
/// Un SF Symbol peut avoir 4 cas de rendering :
///   - `monochrome` ––> couche unique avec une seule couleur
///   - `hierarchical` ––> couches multiples avec une couleur et des opacités différentes
///   - `multicolor` ––> couches multiples avec leur style inhérent
///   - `palette`––> couches mulitples aved différentes couleurs
/// 👉 Pour cela on utilise le modifier `symbolRenderingMode(_:)` si iOS 15 autrement on utilise `renderingMode(_:)`
