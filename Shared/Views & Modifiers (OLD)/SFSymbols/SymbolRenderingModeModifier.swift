//
//  SymbolRenderingModeModifier.swift
//  iOS
//
//  Created by Lucas Abijmil on 12/06/2021.
//

import SwiftUI

#warning("FIXME - TO DO")

struct SymbolRenderingModeModifier: View {
  var body: some View {
    VStack(spacing: 20) {
      Image(systemName: "theatermasks")
        .symbolRenderingMode(.hierarchical)
        .font(.system(size: 144))

      Image(systemName: "shareplay")
        .symbolRenderingMode(.palette)
        .foregroundStyle(.blue, .red)
        .font(.system(size: 144))

      Image(systemName: "person.3.sequence.fill")
        .symbolRenderingMode(.palette)
        .foregroundStyle(.blue, .green, .red)
        .font(.system(size: 144))
    }
  }
}

struct SymbolRenderingModeModifier_Previews: PreviewProvider {
  static var previews: some View {
    SymbolRenderingModeModifier()
  }
}
