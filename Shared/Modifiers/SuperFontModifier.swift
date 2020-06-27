//
//  SuperFontModifier.swift
//  Shared
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

#warning("À améliorer")

struct SuperFontModifier: View {
    var body: some View {
        Text("Hello, world!")
          .font(Font.body.lowercaseSmallCaps())
          .padding()
    }
}

struct SuperFontModifier_Previews: PreviewProvider {
    static var previews: some View {
      SuperFontModifier()
    }
}
