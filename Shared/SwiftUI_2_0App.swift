//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

@main
struct SwiftUI_2_0App: App {

  /// C'est ici qu'on créer et qu'on injecte les données
  /// @StateObject qui seront injectés en tant que environmentObject à la vue
  @StateObject var userViewModel = UserViewModel()


  var body: some Scene {
    WindowGroup {
      EnvironmentWrapper()
        /// Injection de dépendances dans toutes les vues :)
        .environmentObject(userViewModel)
    }
  }
}
