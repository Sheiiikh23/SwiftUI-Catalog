//
//  SwiftUI_2_0App.swift
//  Shared
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

@main
struct SwiftUI_2_0App: App {

  /// C'est ici qu'on ajoute notre AppDelegate lorsqu'on en utilise un
  /// Ce wrapper se charge de créer notre AppDelegate et de gérer tout le reste
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  /// C'est ici qu'on créer et qu'on injecte les données
  // Déclaration des @StateObject & @EnvironmentObject etc...
  var body: some Scene {
    WindowGroup {
      Locale()
    }
  }
}

/// On peut créer une class conforme à UIApplicationDelegate dans laquelle on va pouvoir faires les mêmes choses qu'auparavant tel que les push notifications
class AppDelegate: NSObject, UIApplicationDelegate {

  /// Ajout de n'importe quelle fonction
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    return true
  }

}
