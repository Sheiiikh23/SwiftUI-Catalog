//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, Mac Catalyst 13.0
/// Description : Permet de connaître la taille horizontale de l'environment
///
/// Définition de l'`EnvironmentValue` :
///   - var horizontalSizeClass: UserInterfaceSizeClass? { get set }
///     - UserInterfaceSizeClass :
///       - compact
///       - regular
///
/// Remarques :
///   - Généralement on l'utilise lorsque l'application est en mode `portrait` ou `portraitUpsideDown`
///   - En fonction de l'`horizontalSizeClass` on adapte le layout : `TabView` en mode compact & `SideBar` en mode regular
///   - Pour connaître les size class en fonction des devices : https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/adaptivity-and-layout/

struct HorizontalSizeClass: View {

  @Environment(\.horizontalSizeClass) private var horizontalSizeClass

  var body: some View {
    switch horizontalSizeClass {
    case .compact:
      Text("Horizontal size class is compact")
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(.red)
    case .regular:
      Text("Horizontal size class is regular")
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(.green)
    default:
      Text("Unknown horizontal size class")
        .font(.title)
        .fontWeight(.bold)
    }
  }
}

struct HorizontalSizeClass_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      HorizontalSizeClass()
        .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
      HorizontalSizeClass()
        .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (3rd generation)"))
    }
  }
}
