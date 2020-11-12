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
// MARK: - Utilisation : Création d'un player qu'on peut ± custom

struct VideoPlayerView: View {

    var body: some View {
      ZStack {

        /// VideoPlayer sans overlay
        VideoPlayer(player: AVPlayer(url: URL(string: "https://bit.ly/swswift")!))

        /// VideoPlayer avec un overlay (de type View)
        VideoPlayer(player: AVPlayer(url: URL(string: "https://bit.ly/swswift")!)) {
          VStack {
            Text("Hacking with Swift video example")
              .font(.caption)
              .foregroundColor(.white)
              .padding(.horizontal, 20)
              .padding(.vertical)
              .background(Color.white.opacity(0.7))
              .cornerRadius(20)
            Spacer()
          }
          .padding(.top)
        }
      }
      .ignoresSafeArea()
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}

