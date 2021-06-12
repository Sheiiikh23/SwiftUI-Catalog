//
//  TaskModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 11/06/2021.
//

import SwiftUI

/// `task` permet d'exécuter une closure / function asynchrone sur le "onAppear" d'une View
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Deux signatures :
///   - func task(_ action: @escaping () async -> Void) -> some View
///   - func task<T>(id value: T, _ action: @escaping () async -> Void) -> some View where T : Equatable
/// La closure / function est arrêté sur le `onDisappear` de la View

// MARK: - Utilisation : Exécuter une closure / function async sur le onAppear d'une View

enum TaskId {
  case randomBool
}

struct TaskModifier: View {

  @State private var randomInt = 0
  @State private var randomBool = false

  var body: some View {
    VStack {
      Text("Current value of the randomInt : \(randomInt)")
        .task {
          randomInt = await updateRandomInt()
        }
      Text("Current value of the randomBool : \(randomBool.description)")
        .task(id: TaskId.randomBool) {
          randomBool = await updateRandomBool()
        }
    }
  }

  private func updateRandomInt() async -> Int {
    return Int.random(in: 1...100)
  }

  private func updateRandomBool() async -> Bool {
    return Bool.random()
  }
}

struct TaskModifier_Previews: PreviewProvider {
  static var previews: some View {
    TaskModifier()
  }
}
