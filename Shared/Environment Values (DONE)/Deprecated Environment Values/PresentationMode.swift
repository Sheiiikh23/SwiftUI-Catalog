//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Un binding avec le mode de présentation actuelle de la vue
/// Deprecated : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0  👉 utilisation de `dismiss` & `isPresented`
///
/// Définition de l'`EnvironmentValue` :
///   - var presentationMode: Binding<PresentationMode> { get }
///     - s'utilise via la wrappedValue où on peut appeller la fonction dismiss
///
/// Remarque :
///   - Peut être appellé depuis une `sheet`, une `fullScreenCover` ou bien un écran dans une navigation stack

struct PresentationMode: View {

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

  @Environment(\.presentationMode) private var presentationMode
  @State private var showAnotherSheet = false

  var body: some View {
    VStack(spacing: 15) {
      Button { showAnotherSheet.toggle() } label: { Text("Show another sheet") }
      Button { presentationMode.wrappedValue.dismiss() } label: { Text("Dismiss the sheet") }
    }
    .sheet(isPresented: $showAnotherSheet) { SheetContent() }
  }
}

fileprivate struct FullScreenCoverContent: View {

  @Environment(\.presentationMode) private var presentationMode
  @State private var showAnotherFullScreenContent = false

  var body: some View {
    VStack(spacing: 15) {
      Button { showAnotherFullScreenContent.toggle() } label: { Text("Show another full screen cover") }
      Button { presentationMode.wrappedValue.dismiss() } label: { Text("Dismiss the full screen cover") }
    }
    .fullScreenCover(isPresented: $showAnotherFullScreenContent) { FullScreenCoverContent() }
  }
}

fileprivate struct PushedViewContent: View {

  @Environment(\.presentationMode) private var presentationMode

  var body: some View {
    VStack(spacing: 15) {
      NavigationLink("Show another pushed view") { PushedViewContent() }
      Button { presentationMode.wrappedValue.dismiss() } label: { Text("Pop to the previous screen") }
    }
  }
}

struct PresentationMode_Previews: PreviewProvider {
  static var previews: some View {
    PresentationMode()
  }
}
