//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : String qui représente le ocntenu des différentes instances des @Environment values
///
/// Définition de l'`EnvironmentValue` :
///   - var description: String { get }
///
/// Remarque :
///   - Sera utilisé principalement pour debug


struct Description: View {

  @Environment(\.description) private var description
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      Text(description)
    }
  }
}

struct Description_Previews: PreviewProvider {
  static var previews: some View {
    Description()
  }
}
