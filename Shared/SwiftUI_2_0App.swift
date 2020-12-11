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

  /// On peut également accéder à l'état de l'application grâce à ce property wrapper
  /// On retrouve un peu le même fonctionnement que l'AppDelegate
  @Environment(\.scenePhase) var scenePhase

  /// C'est ici qu'on créer et qu'on injecte les données
  /// @StateObject qui seront injectés en tant que environmentObject à la vue
  @StateObject var userViewModel = UserViewModel()


  var body: some Scene {
    WindowGroup {
      TextFieldStyleModifier()
        /// Injection de dépendances dans toutes les vues :)
        .environmentObject(userViewModel)
    }
    .onChange(of: scenePhase) { phase in
      switch phase {
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

/// On peut créer une class conforme à UIApplicationDelegate dans laquelle on va pouvoir faires les mêmes choses qu'auparavant tel que les push notifications
class AppDelegate: NSObject, UIApplicationDelegate {

  /// Ajout de n'importe quelle fonction
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print("Hello from App Delegate")
    return true
  }
}
