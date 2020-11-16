//
//  ToolBarItemView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// ToolBarItem présent uniquement dans une toolBar et donc dans une NavigationView
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
/// 
/// toolbar modifier : cf ToolBarModifier
/// toolBarItemPlacement : cf ToolBarItemPlacement

// MARK: Utilisation : Permet de peupler la toolbar de la NavigationView

struct ToolBarItemView: View {

  @State private var showTrailingItem = true

  var body: some View {
    NavigationView {
      Text("Hello World")
        .navigationTitle("SwiftUI")
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Text("Bar leading")
          }
          ToolbarItem(placement: .bottomBar) {
            HStack {
              Text("Left bottom bar")
              Spacer()
              Text("Right bottom bar")
            }
          }
          ToolbarItem {
            Text("Automatic placement")
          }
          ToolbarItem(id: "trailing", placement: .navigationBarTrailing, showsByDefault: showTrailingItem) {
            Button { showTrailingItem.toggle() } label: {
              Text("Hide me")
            }
          }
        }
    }
  }
}

struct ToolBarItemView_Preview: PreviewProvider {
  static var previews: some View {
    Group {
      ToolBarItemView()
        .previewDevice("iPhone 11 Pro Max")
      ToolBarItemView()
        .previewDevice("iPad Air (3rd generation)")
    }
  }
}
