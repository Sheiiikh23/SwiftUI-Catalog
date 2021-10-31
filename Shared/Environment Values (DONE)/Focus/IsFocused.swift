//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Indique si l'ancêtre focusable le plus proche est focused
///
/// Définition de l'`EnvironmentValue` :
///   - var isFocused: Bool { get }
///      - true : si l'ancêtre le plus proche à le focus
///      - false : si pas d'ancêtre focusable
///
/// Remarques :
///   - Pas trop d'intérêt pour iOS
///   - On utilise en complément les modifiers `focused(_:)` et / ou `focusable(_:)` (deprecated)
///   - Lien intéressant : https://swiftwithmajid.com/2020/12/02/focus-management-in-swiftui/

struct IsFocused: View {

  var body: some View {
    ScrollView {
      LazyHStack {
        ForEach(0..<100) { _ in
          ZStack {
            Poster()
          }
          .focusable()
        }
      }
    }
  }
}

fileprivate struct Poster: View {

  @Environment(\.isFocused) var isFocused

  var body: some View {
    RoundedRectangle(cornerRadius: 16)
      .frame(width: 100, height: 100)
      .scaleEffect(isFocused ? 1.2 : 1)
      .animation(.easeInOut, value: isFocused)
  }
}

struct IsFocused_Previews: PreviewProvider {
  static var previews: some View {
    IsFocused()
  }
}
