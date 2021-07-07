//
//  Button.swift
//  iOS
//
//  Created by Lucas Abijmil on 06/07/2021.
//

import SwiftUI

#warning("FIXME – TO DO")

struct ButtonView: View {
  var body: some View {
    VStack {
      Button("Add") {}
      .buttonStyle(BorderedButtonStyle(tint: .red))
      Button("Add") {}
      .buttonStyle(.bordered)
      .tint(.red)

      HStack {
        Button("1960") {}
          .tint(.purple)
        Button("Bronze") {}
          .tint(.orange)
        Button("Food") {}
        .tint(.red)
      }
      .buttonStyle(.bordered)
      .controlSize(.small) // TODO:
      .controlProminence(.increased) // TODO:

      VStack {
        Button {} label: {
          Text("Add to jar")
            .frame(maxWidth: 300)
        }
        .controlProminence(.increased)
        Button {} label: {
          Text("Add to watchlist")
            .frame(maxWidth: 300)
        }
        .tint(.accentColor)
      }
      .buttonStyle(.bordered)
      .controlSize(.large)

      Button("Delete...", role: .destructive) {} // utiliser dans les confirmDialog ou contextMenu
    }
  }
}

struct ButtonView_Previews: PreviewProvider {
  static var previews: some View {
    ButtonView()
  }
}
