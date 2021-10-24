//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Indique l'état opérationnel de la scène et donc de l'app (ou une partie si multi-windows)
///
/// Définition de l'`EnvironmentValue` :
///   - var scenePhase: ScenePhase { get set }
///     - ScenePhase :
///       - active : la scène est au premier plan et la UI est visible
///       - inactive : la scène est au premier plan mais devrait arrêter ses intérations et work (fetch etc...) et la UI est visible
///       - background : la scène n'est pas visible, la UI non plus
///
/// Remarques :
///   - Peut s'avérer un peu tricky si notre app supporte le multi-windows
///   - Généralement lorsque la scene passe en background, on peut exécuter un certains nombre d'actions
///   - Plus d'info grâce à la doc : https://developer.apple.com/documentation/swiftui/scenephase

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
        fatalError("New state added by Apple")
      }
    }
  }
}
