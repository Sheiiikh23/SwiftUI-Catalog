//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/*
Les EnvironmentValues permettent d'avoir accès à une collection de valeur de l'environnement qui sont propagées à traver la view hierarchy

Pour accéder à une EnvironmentValue, il suffit de déclarer une variable en utilisant le wrapper @Environment en spécifiant la clé de la valeur.
Par exemple, on peut lire la locale actuelle comme il suit : @Environment(\.locale) var locale
Pas besoin de spécifier le type car il est automatiquement inférencé.

SwiftUI définit et met à jour automatiquement de nombreuses valeurs d'environnement comme pixelLength, scenePhase... en fonction du périphérique, de l'état du système ou des paramètres propres à l'utilisateur.
Pour d'autre valeurs, SwiftUI fournit une valeur par défaut raisonnable.

Pour les EnvironmentValues qui peuvent être set, on peut modifier leur valeur grâce au modifier : `environment(_:_:)`
Lorsqu'une valeur est modifié, toutes les vues et sous-vues sont modifiées, provoquant un recompute de leur body
SwiftUI met à disposition des modifiers dédiés pour certaines valeurs comme `lineLimit(_:)`
*/


/*
Pour créer une `EnvironmentValue` il faut que la struct / class soit conforme au protocol `EnvironmentKey`, permettant de créer la valeur par défaut pour cette `EnvironmentValue`
Puis, créer une extension sur `EnvironmentValues` afin d'y ajouter cette nouvelle propriété
Voici un exemple d'une `EnvironmentValue` (get only) permettant de trigger un retour haptic
*/

struct HapticFeedback {

  func impact(strength: UIImpactFeedbackGenerator.FeedbackStyle) {
    let hapticImpact = UIImpactFeedbackGenerator(style: strength)
    hapticImpact.prepare()
    hapticImpact.impactOccurred()
  }

  fileprivate enum EnvironmentKey: SwiftUI.EnvironmentKey {
    static let defaultValue = HapticFeedback()
  }
}

extension EnvironmentValues {

  var hapticFeedback: HapticFeedback {
    get {
      self[HapticFeedback.EnvironmentKey.self]
    }
  }
}
