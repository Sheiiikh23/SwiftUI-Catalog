//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

@main
struct SwiftUI_2_0App: App {

  /// C'est ici qu'on ajoute notre AppDelegate lorsqu'on en utilise un
  /// Ce wrapper se charge de créer notre AppDelegate et de gérer tout le reste
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  /// C'est ici qu'on créer et qu'on injecte les données
  /// @StateObject qui seront injectés en tant que environmentObject à la vue
  @StateObject var userViewModel = UserViewModel()


  var body: some Scene {
    WindowGroup {
      DynamicTypeSize()
        /// Injection de dépendances dans toutes les vues :)
        .environmentObject(userViewModel)
    }
  }
}

/// On peut créer une class conforme à UIApplicationDelegate dans laquelle on va pouvoir faires les mêmes choses qu'auparavant tel que les push notifications
final class AppDelegate: NSObject, UIApplicationDelegate {

  /// Ajout de n'importe quelle fonction
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print("Hello from App Delegate")
    return true
  }
}
