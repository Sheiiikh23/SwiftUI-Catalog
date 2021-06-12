//
//  ForegroundStyleModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 10/06/2021.
//

import SwiftUI

//func foregroundStyle<S>(_ style: S) -> some View where S : ShapeStyle

#warning("TODO")

struct ForegroundStyleModifier: View {

  var body: some View {
    HStack {
      Image(systemName: "clock.fill")
      Text("Set the time")
    }
    .font(.largeTitle.bold())
//    .foregroundStyle(.tertiary) // quaternary
    .foregroundStyle(LinearGradient(colors: [.red, .blue, .purple], startPoint: .top, endPoint: .bottom))
  }
}

struct ForegroundStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    ForegroundStyleModifier()
  }
}
