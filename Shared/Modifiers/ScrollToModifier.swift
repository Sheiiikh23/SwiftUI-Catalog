//
//  ScrollToModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 04/07/2020.
//

import SwiftUI

/// ScrollTo qui permet de scroll à un endroit particulier via un ScrollViewProxy
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Pour utiliser ce modifier :
///   • Ajouter un ScrollViewReader qui passe une valeur locale (= ScrollViewProxy): cf ScrollViewReader & ScrollViewProxy
///   • Donner un id à chaque View contenue dans le ScrollViewReader
///
/// Paramètres de la fonction via le ScrollViewProxy :
///   • id: obligatoire
///   • anchor : optionnel si pas d'anchor définie alors le ScrollViewProxy va scroll le "moins possible" pour afficher la view

// MARK: - Utilisation : Permer d'accéder à un élément faisant partie d'un ScrollView via son id 

struct ScrollToModifier: View {

  let colors: [Color] = [.red, .green, .blue]

  var body: some View {
    ScrollView {
      ScrollViewReader { proxy in
        Button {
          /// withAnimation fonctionne (on peut pas set l'animation par contre Xcode 12.2)
          /// Permet d'éviter le scroll brutale
          withAnimation {
            /// scroll à l'id 5 avec une anchor .top
            proxy.scrollTo(5, anchor: .top)
          }
        } label: {
          Text("Scroll to position #5 top anchor")
        }
        Button {
          /// scroll à l'id 7 avec une anchor .center
          proxy.scrollTo(7, anchor: .center)
        } label: {
          Text("Scroll to position #7 center anchor")
        }
        Button {
          /// scroll à l'id 10 avec une anchor .bottom
          proxy.scrollTo(10, anchor: .bottom)
        } label: {
          Text("Scroll to position #10 bottom anchor")
        }
        Button {
          withAnimation {
            /// scroll à l'id 13 sans anchor (scrollera le moins possible)
            proxy.scrollTo(13)
          }
        } label: {
          Text("Scroll to position #13 without predefined anchor")
        }
        ForEach(0...15, id: \.self) { item in
          Text("Example \(item)")
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .background(colors[item % colors.count])
            /// Donner un ID à chaque vue dans le scroll si on veut utiliser le modifier
            .id(item)
        }
      }
    }
  }
}

struct ScrollToModifier_Previews: PreviewProvider {
  static var previews: some View {
    ScrollToModifier()
  }
}
