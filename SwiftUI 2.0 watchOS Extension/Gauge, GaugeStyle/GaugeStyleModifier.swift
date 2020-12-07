//
//  GaugeStyleModifier.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 08/12/2020.
//

import SwiftUI

/// Modifier propre pour les Gauge
/// Disponible sur : watchOS / Mac Catalyst
///
/// GaugStyle présents nativement :
///   • LinearGaugeStyle ––> force la gauge en Linear
///   • LinearGaugeStyle(tint: Color) ––> gauge Linear + color de la gauge
///   • LinearGaugeStyle(tint: Gradient) ––> gauge Linear + gradient de la gauge
///   • CircularGaugeStyle ––> force la gauge en Circular
///   • CircularGaugeStyle(tint: Color) ––> gauge Circular + color de la gauge
///   • CircularGaugeStyle(tint: Gradient) ––> gauge Circular + gradient de la gauge
///
/// Créer une GaugeStyle custom:
///  • struct conforme au protocol GaugeStyle ––> fonction makeBody

// MARK: - Utilisation : Permet de customiser la UI d'une Gauge

struct GaugeStyleModifier: View {
  var body: some View {
    ScrollView {
      LazyVStack(spacing: 30) {

        // MARK: - LinearGaugeStyle
        Gauge(value: 0.5) {
          Text("Label")
        }
        .gaugeStyle(LinearGaugeStyle())

        // Avec couleur
        Gauge(value: 0.5) {
          Text("Label")
        }
        .gaugeStyle(LinearGaugeStyle(tint: .pink))

        // Avec gradient
        Gauge(value: 0.5) {
          Text("Label")
        }
        .gaugeStyle(LinearGaugeStyle(tint: Gradient(colors: [.red, .orange, .yellow])))

        // MARK: - CircularGaugeStyle
        Gauge(value: 0.5) {
          Text("Label")
        }
        .gaugeStyle(CircularGaugeStyle())

        // Avec couleur
        Gauge(value: 0.5) {
          Text("Label")
        }
        .gaugeStyle(CircularGaugeStyle(tint: .pink))

        // Avec gradient
        Gauge(value: 0.5) {
          Text("Label")
        }
        .gaugeStyle(CircularGaugeStyle(tint: Gradient(colors: [.red, .orange, .yellow])))

        // MARK: - Custom GaugeStyle
        Gauge(value: 0.5) {
          Text("Label")
        }
        .gaugeStyle(CustomGaugeStyle())
      }
    }
  }
}

struct CustomGaugeStyle: GaugeStyle {

  func makeBody(configuration: Configuration) -> some View {
    Gauge(value: configuration.value) {
      configuration.label.foregroundColor(.red)
    }
    .gaugeStyle(CircularGaugeStyle())
  }
}

struct GaugeStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    GaugeStyleModifier()
  }
}
