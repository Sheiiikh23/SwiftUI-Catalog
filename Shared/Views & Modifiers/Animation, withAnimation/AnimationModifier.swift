//
//  withAnimation.swift
//  iOS
//
//  Created by Lucas Abijmil on 12/06/2021.
//

import SwiftUI

/// `animation` permet d'ajouter une animation dite implicite à une `View`
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Deux signatures possibles :
///   - func animation(_ animation: Animation?) -> some View : deprecated à partir d'iOS 15
///   - func animation<V>(_ animation: Animation?, value: V) -> some View where V : Equatable

// MARK: - Utilisation : Ajouter une animation à une View

struct AnimationWithoutValueModifier: View {

  @State private var scaledUp = true

  var body: some View {
    Text("First")
      .scaleEffect(scaledUp ? 2 : 1)
      .animation(.linear(duration: 1))
      .onTapGesture { scaledUp.toggle() }
  }
}

struct AnimationWithValueModifier: View {

  @State private var scaledUp = true

  var body: some View {
    Text("First")
      .scaleEffect(scaledUp ? 2 : 1)
      .animation(.linear(duration: 1), value: scaledUp)
      .onTapGesture { scaledUp.toggle() }
  }
}

struct AnimationModifier_Previews: PreviewProvider {
  static var previews: some View {
    AnimationWithoutValueModifier()
  }
}
