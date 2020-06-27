//
//  CustomFontModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Custom font modifier à traver font modifier
///
/// Désormais les customs fonts scalent automatiquement :-)

struct CustomFontModifier: View {
  var body: some View {
    Text("Hello world")
      .font(.custom("AvenirNext-Regular", size: 30))
  }
}

struct CustomFontModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CustomFontModifier()
      CustomFontModifier()
        .environment(\.sizeCategory, .extraExtraExtraLarge)
    }
  }
}
