//
//  InteractiveDismissDisabledModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 10/06/2021.
//

import SwiftUI

/// `interactiveDismissDisabled` permet de rendre une View contenue dans une `sheet` ou `popover` non swipe to dismiss
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Une seule signature :
///   - interactiveDismissDisabled(_ isDisabled: Bool = true) -> some View
/// Peut être issue d'une @State var contenue dans la fonction
/// Autrement on peut placer par exemple un bouton avec une @Environment(\.presentationMode) var qui permet de dismiss la sheet / popover

// MARK: - Utilisation : Pour rendre une sheet ou popover non swipe to dismiss

struct InteractiveDismissDisabledModifier: View {

  @State private var showInteractive = false
  @State private var showInteractiveWithBool = false

  var body: some View {
    VStack {
      Button { showInteractive.toggle() } label: {
        Text("Show interactiveDismissDisabled without bool")
      }
      Button { showInteractiveWithBool.toggle() } label: {
        Text("Show interactiveDismissDisabled with bool")
      }
    }
    .sheet(isPresented: $showInteractive, content: InteractiveDismissDisabledWithoutBoolModifier.init)
    .sheet(isPresented: $showInteractiveWithBool, content: InteractiveDismissDisabledWithBoolModifier.init)
  }
}

struct InteractiveDismissDisabledWithoutBoolModifier: View {

  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    VStack {
      Text("Sheet View")
      Button { presentationMode.wrappedValue.dismiss() } label: {
        Text("Dismiss")
      }
    }
    .interactiveDismissDisabled()
  }
}

struct InteractiveDismissDisabledWithBoolModifier: View {

  @State private var isDissmisable = false

  var body: some View {
    VStack {
      Button { isDissmisable.toggle() } label: {
        Text("Toggle the swipe to dissmiss, current value : \(isDissmisable.description)")
      }
    }
    .interactiveDismissDisabled(!isDissmisable)
  }
}

struct InteractiveDismissDisabledModifier_Preview: PreviewProvider {
  static var previews: some View {
    InteractiveDismissDisabledModifier()
  }
}
