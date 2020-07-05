//
//  StateObjectWrapper.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import SwiftUI

/// StateObject
/// En iOS13 pour une class conforme au protocol ObservableObject  j'aurai utilisé @ObservedObject
/// Ça marchera tout le temps de procédé de cette manière
/// Cependant : ce code peut potentiellement crash
/// Le problème vient du fait SwiftUI  qui peut détruire et recréer ses vues quand elle le souhaite
/// Si ce la se produit alors notre objet serait aussi détruit
/// Également le body peut être créer avant l'objet conforme au protocol ObservableObject et si cela se produit notre codce crashera de manière totalement random
/// Pour contrer ce problème il faut utiliser le nouveau proprety wrapper : @StateObject
/// SwiftUI nous garantit que cette objet sera créer avant le body et ne sera pas détruit même si la vue est détruite puis récréer
/// @StateObject propre à la vue
/// On peut bien sûr l'injécter dans l'environment de l'application
///


class User: ObservableObject {
  var username = "@lucas_abijmil"
}

struct StateObjectWrapper: View {

  /// Ancienne manière
//  @ObservedObject var user = User()

  /// Nouvelle manière
  @StateObject var user = User()

    var body: some View {
        Text("username: \(user.username)")
    }
}

struct StateObjectWrapper_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectWrapper()
    }
}
