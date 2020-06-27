//
//  HelpModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

#warning("À améliorer")

struct HelpModifier: View {
  var body: some View {
    Button(action: {}) {
      Label("Hello World !", systemImage: "person")
    }
    // Sur macOS créer une bulle si on reste sur le bouton (bulle classique)
    // iPadOS ?? 
    // Sur iOS voiceOver lira la string dans cette méthode
    .help("Text saying Hello World by Lucas Abijmil")
  }
}

struct HelpModifier_Previews: PreviewProvider {
  static var previews: some View {
    HelpModifier()
  }
}
