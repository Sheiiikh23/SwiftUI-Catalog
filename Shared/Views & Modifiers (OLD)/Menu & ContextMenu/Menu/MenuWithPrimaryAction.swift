//
//  SwiftUIView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 10/06/2021.
//

import SwiftUI

/// Nouvelle fonctionnalité pour les menus, on peut désormais mettre une primaryAction si l'utilisateur fait un simple tab

#warning("To Do")

struct MenuWithPrimaryAction: View {
  var body: some View {
    Menu("Options") {
      Button("Order now", action: placeOrder)
      Button("Adjust or", action: adjustOrder)
      Button("Cancel", action: cancelOrder)
    } primaryAction: {
      print("WhatEver")
    }
  }

  func placeOrder() { print("place") }
  func adjustOrder() { print("adjust") }
  func cancelOrder() { print("cancel") }
}

struct MenuWithPrimaryAction_Previews: PreviewProvider {
  static var previews: some View {
    MenuWithPrimaryAction()
  }
}
