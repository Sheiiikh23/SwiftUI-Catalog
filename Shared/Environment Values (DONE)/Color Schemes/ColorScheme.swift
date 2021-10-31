//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de connaître le colorScheme de l'utilisateur (light or dark)
///
/// Définition de l'`EnvironmentValue` :
///   - var colorScheme: ColorScheme { get set }
///       - light : par défaut
///       - dark : si l'utilisateur l'a activé
///
/// Remarque :
///   - En complément, on utilise souvent la propriété `colorSchemeContrast` de l'environmment
///
/// Dans le simulateur : Appearance ––> Light or Dark

struct ColorScheme: View {

  @Environment(\.colorScheme) private var colorScheme

  var body: some View {
    if case .dark = colorScheme {
      ZStack {
        Color.purple.edgesIgnoringSafeArea(.all)
        Text("The color scheme is dark")
          .foregroundColor(.white)
          .fontWeight(.bold)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color.black)
          .clipShape(Capsule())
      }
    } else {
      ZStack {
        Color.yellow.edgesIgnoringSafeArea(.all)
        Text("The color scheme is white")
          .foregroundColor(.black)
          .fontWeight(.bold)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color.white)
          .clipShape(Capsule())
      }
    }
  }
}

struct ColorScheme_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ColorScheme()
      ColorScheme()
        .environment(\.colorScheme, .dark)
    }
  }
}
