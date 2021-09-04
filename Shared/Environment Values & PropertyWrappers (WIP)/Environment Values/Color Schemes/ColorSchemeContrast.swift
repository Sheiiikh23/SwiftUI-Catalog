//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de connaître le contraste associé au colorScheme
///
/// Définition de l'`EnvironmentValue` :
///   - var colorSchemeContrast: ColorSchemeContrast { get }
///       - standard : par défaut
///       - increased: si l'utisateur l'a activé
///
/// Remarques :
///   - Si increased alors il doit y avoir un contraste accru entre les couleurs d'avants et d'arrières plans
///
/// Dans le simulateur : Environment Overrides –> Accessibility ––> Differentiate Without Color ––> Increase Contrast

struct ColorSchemeContrast: View {

  @Environment(\.colorSchemeContrast) private var colorSchemeContrast

  var body: some View {
    if case .increased = colorSchemeContrast {
      ZStack {
        Color.purple.edgesIgnoringSafeArea(.all)
        Text("Color contrast is increased")
          .foregroundColor(.white)
          .fontWeight(.bold)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color.green)
          .clipShape(Capsule())
      }
    } else {
      ZStack {
        Color.yellow.edgesIgnoringSafeArea(.all)
        Text("Color constrast is default")
          .foregroundColor(.black)
          .fontWeight(.bold)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color.blue)
          .clipShape(Capsule())
      }
    }
  }
}

struct ColorSchemeContrast_Previews: PreviewProvider {
  static var previews: some View {
    ColorSchemeContrast()
  }
}
