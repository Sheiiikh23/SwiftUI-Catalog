//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de savoir si la préférence système pour la réduction des mouvements est activée
///
/// Définition de l'`EnvironmentValue` :
///   - var accessibilityReduceMotion: Bool { get }
///       - false : par défaut
///       - true : si l'utilisateur l'a activé
///
/// Remarques :
///   - Si true, alors éviter les animations importants (2D ou 3D)
///   - Proposition d'une extension sur `View` afin d'appliquer ou non ces animations en fonction de la préférence système
///
/// Dans le simulateur : Environment Overrides –> Accessibility ––> Differentiate Without Color ––> Reduce Motion

struct AccessibilityReduceMotion: View {

  @Environment(\.accessibilityReduceMotion) private var accessibilityReduceMotion
  @State private var scaleEffect: CGFloat = 1

  var body: some View {
    VStack {
      Text("Scale effect with / without animation")
        .font(.body)
        .fontWeight(.bold)
        .scaleEffect(scaleEffect)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.blue)
        .clipShape(Capsule())
        .onTapGesture {
          withAnimation(accessibilityReduceMotion ? .none : .easeIn) {
            scaleEffect *= 1.5
          }
        }
        .onChange(of: scaleEffect) { _ in
          DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            withAnimation(accessibilityReduceMotion ? .none : .easeOut) { scaleEffect = 1 }
          }
        }
    }
  }
}

extension View {

  func withOptionnalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    return UIAccessibility.isReduceMotionEnabled ? try body() : try withAnimation(animation, body)
  }
}

struct AccessibilityWithOptionnalAnimation: View {

  @State private var scaleEffect: CGFloat = 1

  var body: some View {
    VStack {
      Text("Scale effect with / without withOptionnalAnimation function")
        .font(.body)
        .fontWeight(.bold)
        .scaleEffect(scaleEffect)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.blue)
        .clipShape(Capsule())
        .onTapGesture {
          withOptionnalAnimation(.easeIn) {
            scaleEffect *= 1.5
          }
        }
        .onChange(of: scaleEffect) { _ in
          DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            withOptionnalAnimation(.easeOut) { scaleEffect = 1 }
          }
        }
    }
  }
}

struct AccessibilityReduceMotion_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AccessibilityReduceMotion()
      AccessibilityWithOptionnalAnimation()
    }
  }
}
