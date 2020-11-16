//
//  ScaleMetricWrapper.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// @ScaledMetric permet de faire scale dynamiquement des View en se basant sur sizeCategory de l'utilisateur
/// Disponible sur : i•Pad•OS / watchOS / tvOS / MacOS / Mac Catalyst
///
/// Permet de faire scale la value en fonction du dynamicType (= sizeCategory) de l'utilisateur
///
/// Possibilité de spécifier un Font.TextStyle pour scale de manière relative (👍)

// MARK: - Utilisation : faire up•down•scale des Views en fonction de la sizeCategory de l'utilisateur

struct ScaledMetricWrapper: View {

  @ScaledMetric private var frame: CGFloat = 100
  @ScaledMetric(relativeTo: .title) private var titleFrame: CGFloat = 100

  var body: some View {
    VStack(spacing: 50) {
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .foregroundColor(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
        .frame(width: frame, height: frame)
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .foregroundColor(.red)
        .frame(width: titleFrame, height: titleFrame)
    }
  }
}

struct ScaleMetricWrapper_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ScaledMetricWrapper()
      ScaledMetricWrapper()
        .environment(\.sizeCategory, .extraExtraLarge)
      ScaledMetricWrapper()
        .environment(\.sizeCategory, .extraSmall)
      ScaledMetricWrapper()
        .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
    }
  }
}
