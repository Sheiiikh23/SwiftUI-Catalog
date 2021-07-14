//
//  SymbolVariant.swift
//  iOS
//
//  Created by Lucas Abijmil on 06/07/2021.
//

import SwiftUI

#warning("FIXME – TO DO")

struct SymbolVariantModifier: View {

  var body: some View {
    ZStack {
      Image(systemName: SFSymbol.mic.rawValue)
        .font(.system(size: 100, weight: .regular))
        .imageScale(.large)
        .symbolVariant(.fill.circle) // TODO: .fill correspond au SFSymbol.rawValue.fill
        .symbolRenderingMode(.palette)
        .foregroundStyle(
          Color.white.opacity(0.8),
          Color.blue,
          LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 40))
    }
  }
}

struct SymbolVariantModifier_Previews: PreviewProvider {
  static var previews: some View {
    SymbolVariantModifier()
  }
}
