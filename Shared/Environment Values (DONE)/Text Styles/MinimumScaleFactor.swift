//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de déterminer relativement la proportion minimale autorisée pour réduire la taille de la police afin de faire rentrer le maximum de texte dans l'espace disponible
///
/// Définition de l'`EnvironmentValue` :
///   - var minimumScaleFactor: CGFloat { get set }
///     - 1 par défaut
///     - 0 ≤ minimumScaleFactor ≤ 1 (si > 1, automatique set à 1)
///
/// Remarque :
///   - La proportion est la réduction "maximale" autorisée. Par exemple, si une échelle est set à 0.1, SwiftUI peut attribuer automatiquement une échelle supérieur si tout le texte est rentré

struct MinimumScaleFactor: View {

  @Environment(\.minimumScaleFactor) private var minimumScaleFactor
  @State private var myTextField = ""

  var body: some View {
    VStack(spacing: 20) {
      Text("Minimum scale factor : \(String(format: "%.2f", minimumScaleFactor))")
        .font(.title)
        .fontWeight(.bold)
      HStack {
        Text("This is a very long text: ")
          .lineLimit(1)
          .minimumScaleFactor(minimumScaleFactor)
        TextField("My long textfield", text: $myTextField)
          .frame(width: 250, height: 50)
      }
    }
  }
}

struct MinimumScaleFactor_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      MinimumScaleFactor()
      MinimumScaleFactor()
        .environment(\.minimumScaleFactor, 99)
      MinimumScaleFactor()
        .environment(\.minimumScaleFactor, 0.75)
      MinimumScaleFactor()
        .environment(\.minimumScaleFactor, 0.5)
      MinimumScaleFactor()
        .environment(\.minimumScaleFactor, 0.3)
      MinimumScaleFactor()
        .environment(\.minimumScaleFactor, 0.1)
    }
  }
}
