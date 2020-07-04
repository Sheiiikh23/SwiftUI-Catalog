//
//  VideoPlayerView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 03/07/2020.
//

import AVKit
import SwiftUI

/// Apparitition d'un vidéo player natif pour des vidéos en local ou remote
/// Disponible sur : i•Pad•OS / tvOS / macOS / Mac Catalyst
///
/// Deux constructeurs :
///   • VideoPlayer(player: AVPlayer(...))
///   • VideoPlayer(player: AVPlayer(...)) { ... } pour rajouter un overlay par dessus le player


struct VideoPlayerView: View {
    var body: some View {

      /// Constructeur avec un videoOverlay
      VideoPlayer(player: AVPlayer(
                    url: URL(string: "https://www.youtube.com/watch?v=-h8pk2pe7Xo&t=916s")!)) {
        Text("Watermark")
          .font(.caption)
          .foregroundColor(.white)
          .background(Color.black.opacity(0.7))
          .clipShape(Capsule())
      }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}

