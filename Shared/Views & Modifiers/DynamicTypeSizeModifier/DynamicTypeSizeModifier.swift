//
//  DynamicTypeSizeModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 04/07/2021.
//

import SwiftUI

#warning("FIXME – TO DO")

struct DynamicTypeSizeModifier: View {
  var body: some View {
    VStack {
      Text("Hello, World!")
        .dynamicTypeSize(.large ... .xxLarge) /// plusieurs trucs possible

      Text("Hello, World!")
        .dynamicTypeSize(...(.large))

      /// intersection
      Text("Hello, World!")
        .dynamicTypeSize(.small)
        .dynamicTypeSize(...(.large))

      Text("Hello, World!")
        .dynamicTypeSize(.xLarge)
        .dynamicTypeSize(...(.large))
    }
  }
}

struct DynamicTypeSizeModifier_Previews: PreviewProvider {
  static var previews: some View {
    DynamicTypeSizeModifier()
  }
}
