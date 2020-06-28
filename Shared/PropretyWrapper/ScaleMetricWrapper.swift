//
//  ScaleMetricWrapper.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Apparition d'un nouveau proprety wrapper : @ScaledMetric
/// Disponible sur : i•Pad•OS / watchOS / tvOS / MacOS / Mac Catalyst
///
/// Permet de faire scale la value en fonction du dynamicType de l'utilisateur
/// Créer des layouts responsives

struct ScaleMetricWrapper: View {

  @ScaledMetric private var padding: CGFloat = 10

  var body: some View {
    VStack {
      Text("Hello ScaledMetric proprety wrapper")
        .font(.subheadline)
        .fontWeight(.bold)
        .multilineTextAlignment(.center)
      Text("A very cool new feature")
    }
    .padding(padding)
    .background(Color.purple)
    .cornerRadius(10)
  }
}

struct ScaleMetricWrapper_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ScaleMetricWrapper()
      ScaleMetricWrapper()
        .environment(\.sizeCategory, .extraExtraLarge)
      ScaleMetricWrapper()
        .environment(\.sizeCategory, .extraSmall)
      ScaleMetricWrapper()
        .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
    }
  }
}
