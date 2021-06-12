//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Une `View` qui arrange ses sous-vues dans un plan en 3D
///
/// 1 signature pour un `ZStack` :
///   - init(alignment: Alignment = .center, @ViewBuilder content: () -> Content) where Content : View
/// Paramètres :
///   - alignment: `Alignment` = .center
///           - top
///           - leading
///           - bottom
///           - trailing
///           - center
///           - topLeading
///           - topTrailing
///           - bottomLeading
///           - bottomTrailing
///   - @ViewBuilder content: () -> Content : un ensemble de `View` (maximum 10 subviews)
///
/// Tips: Utiliser un `ZStack` pour afficher un background avec une couleur (voir `ZStackBackgroundColorView`)

struct ZStackDemoView: View {

  var body: some View {

    ScrollView {
      VStack(spacing: .extraLarge) {

        /// alignment = .center
        ZStack {
          Rectangle()
            .foregroundColor(.red)
            .frame(width: 300, height: 300)
          Rectangle()
            .foregroundColor(.orange)
            .frame(width: 150, height: 150)
          Rectangle()
            .foregroundColor(.yellow)
            .frame(width: 75, height: 75)
          Text("center")
            .foregroundColor(.black)
        }

        /// alignment = .top
        ZStack(alignment: .top) {
          Rectangle()
            .foregroundColor(.red)
            .frame(width: 300, height: 300)
          Rectangle()
            .foregroundColor(.orange)
            .frame(width: 150, height: 150)
          Rectangle()
            .foregroundColor(.yellow)
            .frame(width: 75, height: 75)
          Text("top")
            .foregroundColor(.black)
        }

        /// alignment = .leading
        ZStack(alignment: .leading) {
          Rectangle()
            .foregroundColor(.red)
            .frame(width: 300, height: 300)
          Rectangle()
            .foregroundColor(.orange)
            .frame(width: 150, height: 150)
          Rectangle()
            .foregroundColor(.yellow)
            .frame(width: 75, height: 75)
          Text("leading")
            .foregroundColor(.black)
        }

        /// alignment = .bottom
        ZStack(alignment: .bottom) {
          Rectangle()
            .foregroundColor(.red)
            .frame(width: 300, height: 300)
          Rectangle()
            .foregroundColor(.orange)
            .frame(width: 150, height: 150)
          Rectangle()
            .foregroundColor(.yellow)
            .frame(width: 75, height: 75)
          Text("bottom")
            .foregroundColor(.black)
        }

        /// alignment = .trailing
        ZStack(alignment: .trailing) {
          Rectangle()
            .foregroundColor(.red)
            .frame(width: 300, height: 300)
          Rectangle()
            .foregroundColor(.orange)
            .frame(width: 150, height: 150)
          Rectangle()
            .foregroundColor(.yellow)
            .frame(width: 75, height: 75)
          Text("trailing")
            .foregroundColor(.black)
        }

        /// alignment = .center
        ZStack(alignment: .center) {
          Rectangle()
            .foregroundColor(.red)
            .frame(width: 300, height: 300)
          Rectangle()
            .foregroundColor(.orange)
            .frame(width: 150, height: 150)
          Rectangle()
            .foregroundColor(.yellow)
            .frame(width: 75, height: 75)
          Text("center")
            .foregroundColor(.black)
        }

        /// alignment = .topLeading
        ZStack(alignment: .topLeading) {
          Rectangle()
            .foregroundColor(.red)
            .frame(width: 300, height: 300)
          Rectangle()
            .foregroundColor(.orange)
            .frame(width: 150, height: 150)
          Rectangle()
            .foregroundColor(.yellow)
            .frame(width: 75, height: 75)
          Text("topLeading")
            .foregroundColor(.black)
        }

        /// alignment = .topTrailing
        ZStack(alignment: .topTrailing) {
          Rectangle()
            .foregroundColor(.red)
            .frame(width: 300, height: 300)
          Rectangle()
            .foregroundColor(.orange)
            .frame(width: 150, height: 150)
          Rectangle()
            .foregroundColor(.yellow)
            .frame(width: 75, height: 75)
          Text("topTrailing")
            .foregroundColor(.black)
        }

        /// alignment = .bottomLeading
        ZStack(alignment: .bottomLeading) {
          Rectangle()
            .foregroundColor(.red)
            .frame(width: 300, height: 300)
          Rectangle()
            .foregroundColor(.orange)
            .frame(width: 150, height: 150)
          Rectangle()
            .foregroundColor(.yellow)
            .frame(width: 75, height: 75)
          Text("bottomLeading")
            .foregroundColor(.black)
        }

        /// alignment = .bottomTrailing
        ZStack(alignment: .bottomTrailing) {
          Rectangle()
            .foregroundColor(.red)
            .frame(width: 300, height: 300)
          Rectangle()
            .foregroundColor(.orange)
            .frame(width: 150, height: 150)
          Rectangle()
            .foregroundColor(.yellow)
            .frame(width: 75, height: 75)
          Text("bottomTrailing")
            .foregroundColor(.black)
        }
      }
      .frame(maxWidth: .infinity)
    }
  }
}

struct ZStackBackgroundColorView: View {

  var body: some View {
    ZStack {
      Color.mint.ignoresSafeArea()
      VStack {
        Text("Un peu de texte")
        Text("Beaucoup plus de texte")
        Text("Beaucoup beaucoup plus de texte")
      }
    }
  }
}

struct ZStackView_Previews: PreviewProvider {
  static var previews: some View {
    ZStackDemoView()
    ZStackBackgroundColorView()
  }
}
