//
//  WindowStyleModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// WindowStyle permet de spécifier l'apparencet et l'interaction d'une fenêtre
/// Disponible sur : macOS
///
/// Trois style natifs :
///   • DefaultWindowStyle : par défaut
///   • HiddenTitleBarWindowStyle : cache le titre et son l'arrière bar de la fenêtre, permet de montrer une plus grande partie du contenu de la fenêtre
///   • TitleBarWindowStyle : affiche la section de la barre de titre de la fenêtre

#if os(macOS)
struct WindowStyleModifier: App {

  @State private var favStyle: FavWindowStyle = .default

  var body: some Scene {
    WindowGroup {
      LabelView()
    }
    .windowStyle(favStyle == .default ? DefaultWindowStyle() : favStyle == .hiddenTitleBar ? HiddenTitleBarWindowStyle() : TitleBarWindowStyle())
  }
}
#endif

fileprivate enum FavWindowStyle {
  case `default`
  case hiddenTitleBar
  case titleBar
}
