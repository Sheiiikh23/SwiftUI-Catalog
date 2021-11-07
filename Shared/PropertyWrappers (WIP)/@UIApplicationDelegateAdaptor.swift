//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, tvOS 14.0, Mac Catalyst 14.0
/// Description : Property wrapper utilisé dans la struct conforme à `App` pour finir un AppDelegate de UIKit
///
/// Déclaration de la variable : @UIApplicationDelegateAdaptor(MyAppDelegate.self) var appDelegate
///
/// Remarques :
///   - La class doit hériter de `NSObject` et `UIApplicationDelegate`
///   - Cela permet d'avoir accès à toutes les fonctions d'un AppDelegate en UIKit
///   - Pour gérer le `didBecomeActive` et le `didEnterBackground` on préferera utiliser l'`@Environment(\.scenePhase)`
///   - Pour les deeplinks on utilisera le modifier `onOpenURL(perform:)`
///   - Pour les user activity on utilisera le modifier `onContinueUserActivity(_:perform:)`

struct UIApplicationDelegateAdaptorWrapper: App {

  /// C'est ici qu'on ajoute notre AppDelegate lorsqu'on en utilise un
  /// Ce wrapper se charge de créer notre AppDelegate et de gérer tout le reste
  @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

  var body: some Scene {
    WindowGroup {
      AppStorageWrapper()
    }
  }
}

final class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print("Hello from App Delegate")
    return true
  }

  // Accès à toutes les autres fonctions possibles ...
}
