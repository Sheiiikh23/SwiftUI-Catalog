//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de savoir si la préférence système pour la réduction de la transparence est activée
///
/// Définition de l'`EnvironmentValue` :
///   - var accessibilityReduceTransparency: Bool { get }
///       - false : par défaut
///       - true : si l'utilisateur l'a activé
///
/// Remarque :
///   - Si true, alors la couleur des backgrounds doit être opaque
///
/// Dans le simulateur : Environment Overrides –> Accessibility ––> Differentiate Without Color ––> Reduce Transparency

struct AccessibilityReduceTransparency: View {

  @Environment(\.accessibilityReduceTransparency) private var isReduceTransparency

  var body: some View {
    ZStack {
      Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)).opacity(isReduceTransparency ? 1 : 0.75).edgesIgnoringSafeArea(.all)
      VStack {
        Text("You may activated the reduce transparency")
          .font(.title3)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
          .foregroundColor(.black)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(isReduceTransparency ? Color.white : Color.red.opacity(0.75))
          .clipShape(Capsule())
      }
    }
  }
}

struct AccessibilityReduceTransparency_Previews: PreviewProvider {
  static var previews: some View {
    AccessibilityReduceTransparency()
  }
}
