//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, Mac Catalyst 13.0
/// Description : Permet de connaître la taille verticale de l'environment
///
/// Définition de l'`EnvironmentValue` :
///   - var horizontalSizeClass: UserInterfaceSizeClass? { get set }
///     - UserInterfaceSizeClass :
///       - compact
///       - regular
///
/// Remarques :
///   - Généralement on l'utilise lorsque l'application est en mode `landscapeLeft` ou `landscapeRight`
///   - Pour connaître les size class en fonction des devices : https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/adaptivity-and-layout/

struct VerticalSizeClass: View {

  @Environment(\.verticalSizeClass) private var verticalSizeClass

  var body: some View {
    switch verticalSizeClass {
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
      Text("Uknown horizontal size class")
        .font(.title)
        .fontWeight(.bold)
    }
  }
}

struct VerticalSizeClass_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      VerticalSizeClass()
        .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
        .previewInterfaceOrientation(.landscapeLeft)
      VerticalSizeClass()
        .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (3rd generation)"))
    }
  }
}
