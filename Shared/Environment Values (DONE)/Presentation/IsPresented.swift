//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Un booléen qui indique si la vue associée à l'environnement est actuellement présentée (pushed ou présenté)
///
/// Définition de l'`EnvironmentValue` :
///   - var isPresented: Bool { get }
///     - true : si la view est une présentée avec `sheet` ou `fullScreenCover` ou navigation stack grâce à `NavigationLink`
///     - false : si racine de la navigation stack
///
/// Remarque :
///   - isPresented au sens "est présentée" (`sheet`, `fullScreenCover`) ou "est pushé" (`NavigationLink`)

struct IsPresented: View {

  @Environment(\.isPresented) private var isPresented
  @State private var showSheet = false
  @State private var showFullScreenCover = false

  var body: some View {
    NavigationView {
      VStack(spacing: 15) {
        Text("View is presented : \(isPresented.description)")
          .fontWeight(.bold)
          .foregroundColor(isPresented ? .green : .red)
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

  @Environment(\.isPresented) private var isPresented
  @State private var showAnotherSheet = false

  var body: some View {
    VStack(spacing: 15) {
      Text("View is presented : \(isPresented.description)")
        .fontWeight(.bold)
        .foregroundColor(isPresented ? .green : .red)
      Button { showAnotherSheet.toggle() } label: { Text("Show another sheet") }
    }
    .sheet(isPresented: $showAnotherSheet) { SheetContent() }
  }
}

fileprivate struct FullScreenCoverContent: View {

  @Environment(\.isPresented) private var isPresented
  @Environment(\.dismiss) private var dismiss
  @State private var showAnotherFullScreenCover = false

  var body: some View {
    VStack(spacing: 15) {
      Text("View is presented : \(isPresented.description)")
        .fontWeight(.bold)
        .foregroundColor(isPresented ? .green : .red)
      Button { showAnotherFullScreenCover.toggle() } label: { Text("Show another sheet") }
      Button { dismiss() } label: { Text("Dismiss") }
    }
    .fullScreenCover(isPresented: $showAnotherFullScreenCover) { FullScreenCoverContent() }
  }
}

fileprivate struct PushedViewContent: View {

  @Environment(\.isPresented) private var isPresented

  var body: some View {
    VStack(spacing: 15) {
      Text("View is presented : \(isPresented.description)")
        .fontWeight(.bold)
        .foregroundColor(isPresented ? .green : .red)
      NavigationLink("Show another pushed view") { PushedViewContent() }
    }
  }
}

struct IsPresented_Previews: PreviewProvider {
  static var previews: some View {
    IsPresented()
  }
}
