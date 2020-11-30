//
//  HorizontalSizeClass.swift
//  iOS
//
//  Created by Lucas Abijmil on 30/11/2020.
//

import SwiftUI

/// horizontalSizeClass indique la class de l'horizontal size du device
/// Disponible sur : i•Pad•OS / Mac Catalyst
///
/// horizontalSizeClass: UserInterfaceSizeClass? { get set }
///   • compact
///   • regular
/// Toutes infos sont ici : https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/adaptivity-and-layout/
/// Même fonctionnement que dans les StoryBoads (dans une époque lointaine 😆...)

struct HorizontalSizeClass: View {

  @Environment(\.horizontalSizeClass) private var horizontalSizeClass

  var body: some View {
    Text("L'orientation horizontal est" + (horizontalSizeClass == .compact ? " compact" : " regular"))
      .font(.title)
      .fontWeight(.bold)
      .multilineTextAlignment(.center)
  }
}

struct HorizontalSizeClass_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      HorizontalSizeClass()
      HorizontalSizeClass()
        .previewDevice("iPad Pro (12.9-inch) (4th generation)")
    }
  }
}
