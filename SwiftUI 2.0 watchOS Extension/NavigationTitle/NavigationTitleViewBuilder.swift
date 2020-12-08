//
//  NavigationTitle.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 08/12/2020.
//

import SwiftUI

/// NavigationTitle peut maintenant prendre une View en paramètre
/// Disponible sur : watchOS
///

struct NavigationTitleViewBuilder: View {
  var body: some View {
    NavigationView {
      Text("Hello navigationTitle with ViewBuilder")
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple)
    }
    .navigationTitle {
      Text("Fr")
        .foregroundColor(.blue)
      +
      Text("anç")
        .foregroundColor(.white)
      +
      Text("ais")
        .foregroundColor(.red)
    }
  }
}

struct NavigationTitle_Previews: PreviewProvider {
  static var previews: some View {
    NavigationTitleViewBuilder()
  }
}
