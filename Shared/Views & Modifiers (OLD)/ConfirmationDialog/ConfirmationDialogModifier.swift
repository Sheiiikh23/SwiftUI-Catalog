//
//  SwiftUIView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 10/06/2021.
//

import SwiftUI

/// Remplaçant de actionSheet

#warning("TODO – Plein d'APIs dispo ")

struct ConfirmationDialogModifier: View {

  @State private var showingOptions = false
  @State private var selected = "None"

  var body: some View {
    Button { showingOptions.toggle() } label: { Text("Show options") }
    .confirmationDialog("Select a color", isPresented: $showingOptions, titleVisibility: .visible) {
      Button("Red") { selected = "Red" }
      Button("Blue") { selected = "Blue" }
      Button("Green") { selected = "Green" }
      Button("Purple") { selected = "Purple" }
    }
  }
}

struct ConfirmationDialogModifier_Previews: PreviewProvider {
  static var previews: some View {
    ConfirmationDialogModifier()
  }
}
