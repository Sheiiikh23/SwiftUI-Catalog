//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Le matériel situé sous la vue actuelle
///
/// Définition de l'`EnvironmentValue` :
///   - var backgroundMaterial: Material? { get set }
///     - Material :
///       - ultraThinMaterial : matériel essentiellement translucide
///       - thinMaterial : matériel qui plus translucide qu'opaque
///       - regularMaterial : matériel qui est quelque peu translucide
///       - thickMaterial : matériel qui est plus opaque que translucide
///       - ultraThickMaterial : matériel qui est principalement opaque
///
/// Remarque :
///   - S'utilise généralement avec les modifiers `background(_:ignoresSafeAreaEdges:)` ou `background(_:in:fillStyle:)`

struct BackgroundMaterial: View {

  @Environment(\.backgroundMaterial) private var backgroundMaterial

  var body: some View {
    VStack(spacing: 20) {
      if let backgroundMaterial = backgroundMaterial {
        ZStack {
          Image("bubble_background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
          VStack(alignment: .leading, spacing: 4) {
            Text("Gradient text")
              .font(.largeTitle)
              .fontWeight(.bold)
              .foregroundStyle(
                .linearGradient(colors: [.purple, .blue],
                                startPoint: .topLeading, endPoint: .bottomTrailing)
              )
            Text("Text with Overlay")
              .fontWeight(.bold)
              .foregroundColor(.primary)
              .blendMode(.overlay)
          }
          .padding(60)
          .background(backgroundMaterial, in: RoundedRectangle(cornerRadius: 20))
        }
      }
    }
  }
}

struct BackgroundMaterial_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      BackgroundMaterial()
      BackgroundMaterial()
        .environment(\.backgroundMaterial, .ultraThinMaterial)
      BackgroundMaterial()
        .environment(\.backgroundMaterial, .thinMaterial)
      BackgroundMaterial()
        .environment(\.backgroundMaterial, .regularMaterial)
      BackgroundMaterial()
        .environment(\.backgroundMaterial, .thickMaterial)
      BackgroundMaterial()
        .environment(\.backgroundMaterial, .ultraThickMaterial)
    }
  }
}
