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

struct SFSymbolsStyles: View {

  var body: some View {
    Image(systemName: "gear")
      .symbolRenderingMode(.hierarchical)

    Image(systemName: "gear")
      .symbolRenderingMode(.monochrome)

    Image(systemName: "gear")
      .symbolRenderingMode(.multicolor)

    Image(systemName: "gear")
      .symbolRenderingMode(.palette)
  }
}

struct CoolSFsymbol: View {

  var body: some View {
    ZStack {
      Image(systemName: SFSymbol.mic.rawValue)
        .font(.system(size: 100, weight: .regular))
        .imageScale(.large)
        .symbolVariant(.fill.circle) // TODO:
        .symbolRenderingMode(.palette)
        .foregroundStyle(
          Color.white.opacity(0.8),
          Color.blue,
          LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 40))
    }
  }
}

struct ColoredSFSymbolsView_Previews: PreviewProvider {
  static var previews: some View {
    ColoredSFSymbolsView()
  }
}
