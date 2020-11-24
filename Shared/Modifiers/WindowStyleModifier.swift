//
//  WindowStyleModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// WindowStyle permet de spécifier l'apparence et l'interaction d'une fenêtre
/// Disponible sur : macOS
///
/// Trois style natifs :
///   • DefaultWindowStyle : par défaut
///   • HiddenTitleBarWindowStyle : cache le titre et son l'arrière bar de la fenêtre, permet de montrer une plus grande partie du contenu de la fenêtre
///   • TitleBarWindowStyle : affiche la section de la barre de titre de la fenêtre

// MARK: - Utilisation : Custom la UI d'une fenêtre pour macOS

@available(macOS 11.0, *)
struct DefaultWindowStyleModifier: App {

  var body: some Scene {
    WindowGroup {
      LabelView()
    }
    .windowStyle(DefaultWindowStyle())
  }
}

@available(macOS 11.0, *)
struct HiddenTitleBarWindowStyleModifier: App {

  var body: some Scene {
    WindowGroup {
      LabelView()
    }
    .windowStyle(HiddenTitleBarWindowStyle())
  }
}

@available(macOS 11.0, *)
struct TitleBarWindowStyleModifier: App {

  var body: some Scene {
    WindowGroup {
      LabelView()
    }
    .windowStyle(TitleBarWindowStyle())
  }
}
