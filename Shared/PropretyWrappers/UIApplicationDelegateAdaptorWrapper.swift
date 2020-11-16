//
//  UIApplicationDelegateAdaptorWrapper.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import SwiftUI

/// @UIApplicationDelegateAdaptor permet de bridger une class représentant l'appDelegate en UIKit
/// Disponible sur : i•Pad•OS / tvOS / Mac Catalyst
///
/// Permet notamment de pouvoir catch des push notifications et autre

// MARK: - Utilisation : Accéder aux fonctions (pas encore) disponible avec l'App Cycle Life en SwiftUI

struct UIApplicationDelegateAdaptorApp: App {

  @UIApplicationDelegateAdaptor(AppDelegateOld.self) var appDelegate

  var body: some Scene {
    WindowGroup {
      SceneStorageWrapper()
    }
  }
}


class AppDelegateOld: NSObject, UIApplicationDelegate {

  /// Ajout de n'importe quelle fonction
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print("Hello from old App Delegate")
    return true
  }
}
