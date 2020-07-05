//
//  SceneStorageWrapper.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import SwiftUI

/// Apparition d'un nouveau proprety wrapper : @SceneStorage
/// Disponible sur : i•Pad•OS / watchOS / tvOS / mac OS / Mac Catalyst
///
/// Permet de sauvegarder  arded des petites datas propres à chaque scene (comme l'état d'une @State var j'imagine)
/// Même fonctionnement qu'un UserDefault sauf que c'est pour chaque scène
/// C'est de la "state restoration", très important pour le multi-window sur iPadOS
/// Le wrapper prend une clé en entrée 

struct SceneStorageWrapper: View {

  @SceneStorage("Saved") var text = ""

  var body: some View {
    NavigationView {
      TextEditor(text: $text)
    }
    .navigationViewStyle(StackNavigationViewStyle() )
  }
}

struct SceneStorageWrapper_Previews: PreviewProvider {
  static var previews: some View {
    SceneStorageWrapper()
  }
}
