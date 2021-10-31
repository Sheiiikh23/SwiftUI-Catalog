//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Permet de connaître quelle proéminence à appliquer aux headers d'une `Section`
///
/// Définition de l'`EnvironmentValue` :
///   - var headerProminence: Prominence { get set }
///       - standard : par défaut
///       - increased
///
/// Remarque :
///   - On peut set la proéminence grâce au modifier `headerProminence(_:)`

struct HeaderProminence: View {

  @Environment(\.headerProminence) var headerProminence

  var body: some View {
    List {
      Section {
        ForEach(0...10, id: \.self) { i in
          Text("Element : \(i)")
        }
      } header: {
        Text("Header with \(headerProminence.description.firstLetterCapitalized) prominence")
      }
      .headerProminence(headerProminence)
    }
  }
}

struct HeaderProminence_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      HeaderProminence()
      HeaderProminence()
        .environment(\.headerProminence, .increased)
    }
    .preferredColorScheme(.dark)
  }
}
