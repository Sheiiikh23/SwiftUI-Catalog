//
//  SpriteKitView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 01/07/2020.
//

import SpriteKit
import SwiftUI

/// Apparition des SpriteView qui permettent de "hoster" une SKScene
/// Disponible sur : i•Pad•OS / watchOS / tvOS / Mac Catalyst
///
/// Il faut d'abord définir une class héritant de SKScene (assez claassique)
/// Dans la view utilisé une computedProprety car il faut définir une frame à la mano

// MARK: - Utilisation : Pour intégrer des mini-scène de jeux à une View

struct SpriteKitView: View {


  var scene: SKScene {
    let scene = GameScene()
    /// Obliger de donner une size à la scene
    scene.size = CGSize(width: 300, height: 400)
    scene.scaleMode = .fill
    return scene
  }

  var body: some View {
    SpriteView(scene: scene)
      .frame(width: 300, height: 400)
  }
}

struct SpriteKitView_Previews: PreviewProvider {
  static var previews: some View {
    SpriteKitView()
  }
}


/// Définition d'une GameScene...
class GameScene: SKScene {
  override func didMove(to view: SKView) {
    physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else { return }
    let location = touch.location(in: self)

    let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
    box.position = location
    box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
    addChild(box)
  }
}
