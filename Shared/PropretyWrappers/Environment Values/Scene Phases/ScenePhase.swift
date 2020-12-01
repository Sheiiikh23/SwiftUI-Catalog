//
//  ScenePhase.swift
//  iOS
//
//  Created by Lucas Abijmil on 01/12/2020.
//

import SwiftUI

/// scenePhase indique l'état actuel de la scene et donc de l'app (ou une partie si multi-windows)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
/// scenePhase: ScenePhase { get set }
///   • active : la scene est au premier plan et est intéractive
///   • inative : la scene est au premier plan mais n'est pas intéractive
///   • background : la scene n'est pas visible (app fermée ou en background)
///
/// Un peu tricky pour le multiple-window donc voici la doc : https://developer.apple.com/documentation/swiftui/scenephase

// MARK: - Importance pour l'accessibilité : très faible - faible
// MARK: - Utilisation : Très utile pour lancer des tâches lorsque l'app change d'une phase à l'autre

struct ScenePhase: App {

  @Environment(\.scenePhase) private var scenePhase

  var body: some Scene {
    WindowGroup {
      LabelView()
    }
    .onChange(of: scenePhase) { scenePhase in
      switch scenePhase {
      case .active:
        print("App is active on the foreground, the UI is visible")
      case .inactive:
        print("App is inactive on the foreground, the UI is visible")
      case .background:
        print("App is in background mode, the UI isn't visible")
      @unknown default:
        print("New state added by Apple")
      }
    }
  }
}
