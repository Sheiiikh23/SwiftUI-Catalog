//
//  WindowToolbarStyleModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// WindowToolbarStyle permet de spécifier l'apparence et le comportement de la barre d'outils d'une fenêtre
/// Disponible sur : macOS
///
/// Trois style natifs :
///   • DefaultWindowToolbarStyle: par défaut
///   • ExpandedWindowToolbarStyle : barre d'outils de fenêtre qui affiche sa zone de barre de titre au-dessus de la barre d'outils
///   • UnifiedWindowToolbarStyle : barre d'outils de fenêtre qui affiche sa barre d'outils et sa barre de titre en ligne
///      - UnifiedWindowToolbarStyle()
///      - UnifiedWindowToolbarStyle(showsTitle: Bool)
///   • UnifiedCompactWindowToolbarStyle : barre d'outils de fenêtre similaire à Unified mais avec une taille verticale plus compacte
///      - UnifiedCompactWindowToolbarStyle()
///      - UnifiedCompactWindowToolbarStyle(showsTitle: Bool)

@available(macOS 11.0, *)
struct DefaultWindowToolbarStyleModifier: App {

  var body: some Scene {
    WindowGroup {
      LabelView()
    }
    .windowToolbarStyle(DefaultWindowToolbarStyle())
  }
}

@available(macOS 11.0, *)
struct ExpandedWindowToolbarStyleModifier: App {

  var body: some Scene {
    WindowGroup {
      LabelView()
    }
    .windowToolbarStyle(ExpandedWindowToolbarStyle())
  }
}

@available(macOS 11.0, *)
struct UnifiedWindowToolbarStyleModifier: App {

  var body: some Scene {
    WindowGroup {
      LabelView()
    }
    .windowToolbarStyle(UnifiedWindowToolbarStyle())
  }
}

@available(macOS 11.0, *)
struct UnifiedCompactWindowToolbarStyleModifier: App {

  var body: some Scene {
    WindowGroup {
      LabelView()
    }
    .windowToolbarStyle(UnifiedCompactWindowToolbarStyle(showsTitle: true))
  }
}
