//
//  Accessibilities.swift
//  iOS
//
//  Created by Lucas Abijmil on 09/12/2020.
//

import SwiftUI

/// L'ensemble des accessibility permettent de custom l'accessibilité, faîte via VoiceOver
/// Pas mal de accesibility... modifier, j'ai listé les plus importants & utiles
/// Disponible sur : i•Pad•OS / watchOS / tvOS / MacOS / Mac Catalyst
///
/// Petit rappel : VoiciOver lis de manière automatique les textes display
///
/// accessibility modifier présents au sein de cette View :
///  • accessibilityHidden : spécifie si VoiceOver est désactivé ou non pour cette View
///  • accessibilityLabel : spécifie un label pour les view qui ne display pas du text. Si la View est un text alors le label du modifier override le text qui sera lu par VoiceOver
///  • accessibilityIdentifier : value pour identifier non lu par VoiceOver, sert principalement pour les tests UI
///  • accessibilityValue : description textuelle de la valeur que la vue contient. À utiliser si différent du text présent dans accessibilityLabel
///  • accessibilityAddTraits : indique le type de la View
///  • accessibilityHint : extra context lorsque l'utilisateur reclique sur la View en question
///
/// J'ai mis les modifiers dans l'odre de lecture effectué par VoiceOver
/// J'ai aussi créer un modifier spéciale qui reprends tous ces modifiers (basicAccessibilities)

struct AccessibilitiesModifiers: View {
  var body: some View {

    // VoiceOver lis le texte par défaut (mais ici overrider par accessibilityLabel)
    Text("Texte automatiquement lu par VoiceOver")
      .accessibilityHidden(false)
      .accessibilityLabel("Current knowledge of SwiftUI VoiceOver")
      .accessibilityIdentifier("Visible to UI Test NOT voicevover")
      .accessibilityValue("60%")
      .accessibilityAddTraits([.isButton])
      .accessibilityHint("Programming is a marathon, take a deep breath & code more ❤️")
  }
}

struct Accessibilities: ViewModifier {

  let isHidden: Bool
  let label: String
  let identifier: String
  let value: String
  let hint: String
  let accessibilityTraits: AccessibilityTraits

  func body(content: Content) -> some View {
    content
      .accessibilityHidden(isHidden)
      .accessibilityLabel(label)
      .accessibilityIdentifier(identifier)
      .accessibilityValue(value)
      .accessibilityHint(hint)
      .accessibilityAddTraits(accessibilityTraits)
  }
}

extension View {
  func basicAccessibilities(isHidden: Bool = false, label: String = "", identifier: String = "", value: String = "", hint: String = "", accessibilityTraits: AccessibilityTraits) -> some View {
    self
      .modifier(Accessibilities(isHidden: isHidden, label: label, identifier: identifier, value: value, hint: hint, accessibilityTraits: accessibilityTraits))
  }
}

struct AccessibilitiesModifiers_Previews: PreviewProvider {
  static var previews: some View {
    AccessibilitiesModifiers()
  }
}
