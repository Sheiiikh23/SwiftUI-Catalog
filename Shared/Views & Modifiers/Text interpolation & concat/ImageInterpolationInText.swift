//
//  ImageInterpolationInText.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Une "Image interpolation" est désomais possible au sein des Text
/// Je vois pas l'intérêt pour des Image "classique" qui ont besoin de différent modifier
/// Par contre grand intérêt pour les SFSymols car scalent de la même "Manière que les Text (mais pareil que Label 🤔)

// MARK: - Utilisation : Je sais pas trop, car on a les labels qui font ± la même chose

struct ImageInterpolationInText: View {
  var body: some View {
    VStack(spacing: 40) {
      Text("\(Image(systemName: "music.mic")) Je suis dans la vallée je roule...")
        .font(.title2)
        .fontWeight(.bold)
      
      Text("\(Image(systemName: "music.note")) Titre : HILLZ")
        .font(.headline)
        .italic()
      
      Text("\(Image(systemName: "person")) Artiste : Laylow & S.Pri Noir")
        .font(.title3)
        .fontWeight(.semibold)
    }
  }
}

struct ImageInterpolationInText_Previews: PreviewProvider {
  static var previews: some View {
    ImageInterpolationInText ()
  }
}
