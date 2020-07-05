//
//  ImageInterpolationInText.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Il est désormais possible au sein des Text de faire une "Image interpolation"
/// Je vois pas l'intérêt pour des Image "classique" qui ont besoin de différent modifier
/// Par contre grand intérêt pour les SFSymols car scalent de la même "Manière que les Text

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
