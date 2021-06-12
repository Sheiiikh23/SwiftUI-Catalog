//
//  GroupBoxView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 08/08/2020.
//

import SwiftUI

/// GroupBox permet de regouper du contenu de même logique
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// La UI par défaut est une card comme dans l'applciation Santé
/// Le Label est une View optionnel, alignement en leading par défaut
/// Pour le content, c'est un VStack implicit
/// On peut mettre plusieurs GroupBox les une dans les autres

// MARK: - Utilisation : Regroupement de contenus de même logique (métier) en forme de card out of the box

struct GroupBoxView: View {

  var body: some View {
    VStack(spacing: 50) {

      /// GroupBox sans Label
      GroupBox {
        Text("Welcome groupBox")
        Text("Your design is beautiful")
      }

      /// GroupBox avec un Label
      GroupBox(
        label: Label("Étages montés", systemImage: "flame.fill")
          .foregroundColor(.orange)
      ) {
        Text("13 ")
          .font(.title)
          .fontWeight(.bold)
        +
        Text("étages")
          .font(.title3)
          .fontWeight(.semibold)
      }
      .padding(.horizontal)

      GroupBox {
        Text("Outer content")
        GroupBox {
          Text("Middle content")
          GroupBox {
            Text("Inner content")
          }
        }
      }
    }
  }
}

struct GroupBoxView_Previews: PreviewProvider {
  static var previews: some View {
    GroupBoxView()
      .preferredColorScheme(.dark)
  }
}
