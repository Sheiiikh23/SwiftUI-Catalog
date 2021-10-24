//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Dismiss la présentation actuelle (pushed ou présenté)
///
/// Définition de l'`EnvironmentValue` :
///   - var dismiss: DismissAction { get }
///     - s'utilise via une fonction `callAsFunction()`, qui peut être appelé depuis la propriété
///
/// Remarque :
///   - Peut être appellé depuis une `sheet`, une `fullScreenCover` ou bien un écran dans une navigation stack

struct Dismiss: View {

  @State private var showSheet = false
  @State private var showFullScreenCover = false

  var body: some View {
    NavigationView {
      VStack(spacing: 15) {
        Button { showSheet.toggle() } label: { Text("Show sheet") }
        .sheet(isPresented: $showSheet) { SheetContent() }
        Button { showFullScreenCover.toggle() } label: { Text("Show full screen cover") }
        .fullScreenCover(isPresented: $showFullScreenCover) { FullScreenCoverContent() }
        NavigationLink("Push view") { PushedViewContent() }
      }
    }
  }
}

fileprivate struct SheetContent: View {

  @Environment(\.dismiss) private var dismiss
  @State private var showAnotherSheet = false

  var body: some View {
    VStack(spacing: 15) {
      Button { showAnotherSheet.toggle() } label: { Text("Show another sheet") }
      Button { dismiss() } label: { Text("Dismiss the sheet") }
    }
    .sheet(isPresented: $showAnotherSheet) { SheetContent() }
  }
}

fileprivate struct FullScreenCoverContent: View {

  @Environment(\.dismiss) private var dismiss
  @State private var showAnotherFullScreenContent = false

  var body: some View {
    VStack(spacing: 15) {
      Button { showAnotherFullScreenContent.toggle() } label: { Text("Show another full screen cover") }
      Button { dismiss() } label: { Text("Dismiss the full screen cover") }
    }
    .fullScreenCover(isPresented: $showAnotherFullScreenContent) { FullScreenCoverContent() }
  }
}

fileprivate struct PushedViewContent: View {

  @Environment(\.dismiss) private var dismiss

  var body: some View {
    VStack(spacing: 15) {
      NavigationLink("Show another pushed view") { PushedViewContent() }
      Button { dismiss() } label: { Text("Pop to the previous screen") }
    }
  }
}


struct Dismiss_Previews: PreviewProvider {
  static var previews: some View {
    Dismiss()
  }
}
