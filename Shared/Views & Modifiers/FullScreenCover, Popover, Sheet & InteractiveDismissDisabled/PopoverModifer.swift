//
//  PopoverModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 29/08/2020.
//

import SwiftUI

/// Popover permet de présenter une sheet / tooltip
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// Différents comportements :
///   • iOS : affichage d'une sheet (un peu bug sur le dismiss
///   • iPadOS / macOS / Mac Catalyst : tooltip
///
/// On peut notamment set :
///   • attachmentAnchor : la position de l'ancre qui définit là où est accroché le popover
///   • arrowEdge : emplacement de la flèche par rapport au popover

struct PopoverModifier: View {

  @State private var showPopover = false

  var body: some View {
    VStack {
      Button { showPopover.toggle() } label: { Text("Show popover") }
    }
    .popover(isPresented: $showPopover) {
      Text("Pop over")
        .padding(.horizontal, 20)
        .padding(.vertical)
        .background(Color.red)
        .cornerRadius(20)
        .padding()
    }
  }
}

struct PopoverModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      PopoverModifier()
      PopoverModifier()
        .previewDevice("iPad Air (3rd generation)")
    }
  }
}
