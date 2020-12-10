//
//  VerticalSizeClass.swift
//  iOS
//
//  Created by Lucas Abijmil on 30/11/2020.
//

import SwiftUI

/// verticalSizeClass indique la class de la vertical size du device
/// Disponible sur : i•Pad•OS / Mac Catalyst
///
/// verticalSizeClass: UserInterfaceSizeClass? { get set }
///   • compact
///   • regular
/// Toutes infos sont ici : https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/adaptivity-and-layout/
/// Même fonctionnement que dans les StoryBoads (dans une époque lointaine 😆...)

// MARK: - Importance pour l'accessibilité : très faible - faible
// MARK: - Utilisation : Très utiles pour provide des View différentes en fonction de la taille du device 

struct VerticalSizeClass: View {

  @Environment(\.verticalSizeClass) private var verticalSizeClass

  var body: some View {
    Text("L'orientation vertical est" + (verticalSizeClass == .compact ? " compact" : " regular"))
      .font(.title)
      .fontWeight(.bold)
      .multilineTextAlignment(.center)
  }
}

struct VerticalSizeClass_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      VerticalSizeClass()
      VerticalSizeClass()
    }
  }
}
