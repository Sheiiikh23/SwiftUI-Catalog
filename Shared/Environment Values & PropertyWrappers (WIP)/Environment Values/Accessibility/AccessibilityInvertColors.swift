//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de savoir si la préférence système pour l'inversion des couleurs est activée
///
/// Définition de l'`EnvironmentValue` :
///   - var accessibilityInvertColors: Bool { get }
///       - false: par défaut
///       - true: si l'utilisateur l'a activé
///
/// Remarque :
///   - Si true, il faut ajuster la UI afin d'obtenir un affichage optimal pour ce cas
///
/// Dans le simulateur : Environment Overrides –> Accessibility ––> Differentiate Without Color ––> Smart Invert

struct AccessibilityInvertColors: View {

  @Environment(\.accessibilityInvertColors) private var isColorInvert

  var body: some View {
    ZStack {
      Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)).edgesIgnoringSafeArea(.all)
      if isColorInvert {
        VStack {
          Text("Invert colors is activated")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.black)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.red)
        .clipShape(Capsule())
      } else {
        VStack {
          Text("Invert colors isn't activated")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.black)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.red)
        .clipShape(Capsule())
      }
    }
  }
}

struct AccessibilityInvertColors_Previews: PreviewProvider {
  static var previews: some View {
    AccessibilityInvertColors()
  }
}
