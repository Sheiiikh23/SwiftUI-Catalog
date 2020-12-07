//
//  SwiftUI_2_0App.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

@main
struct SwiftUI_2_0App: App {
  @SceneBuilder var body: some Scene {
    WindowGroup {
      NavigationView {
        CarouselListStyleModifier()
      }
    }

//    WKNotificationScene(controller: NotificationController.self, category: "myCategory")
  }
}
