//
//  GaugeModifier.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Modifier propre pour les Gauge :
/// Disponible sur : watchOS
///
/// GaugeStyle présents nativement : cf GaugeView pour plus d'exemple
///   • DefaultGaucheStyle ––> par défaut
///   • LinearGaugeStyle ––> par défaut ??
///   • CircularGaugeStyle ––> très très stylé

#warning("Pas mal de bug encore. Regarder les prochaines updates. Lever l'incertitude concernant le markedValueLabels")
struct GaugeModifier: View {

  @State private var volumeValue: CGFloat = 0.5

    var body: some View {

      VStack(spacing: 20) {
        Gauge(value: volumeValue, in: 0...3) {
          Label("Volume", systemImage: "drop.fill")
        } currentValueLabel: {
          Text("\(volumeValue, specifier: "%0.1f")")
        } minimumValueLabel: {
          Text("0")
        } maximumValueLabel: {
          Text("3")
        }
        .gaugeStyle(DefaultGaugeStyle())

        Gauge(value: volumeValue, in: 0...3) {
          Label("Volume", systemImage: "drop.fill")
        } currentValueLabel: {
          Text("\(volumeValue, specifier: "%0.1f")")
        } minimumValueLabel: {
          Text("0")
        } maximumValueLabel: {
          Text("3")
        }
        .gaugeStyle(LinearGaugeStyle())

        Gauge(value: volumeValue, in: 0...3) {
          Label("Volume", systemImage: "drop.fill")
        } currentValueLabel: {
          Text("\(volumeValue, specifier: "%0.1f")")
        } minimumValueLabel: {
          Text("0")
        } maximumValueLabel: {
          Text("3")
        }
        .gaugeStyle(CircularGaugeStyle())
      }
    }
}

#warning("TODO")
/// Essayer de créer un CustomGaugeStyle
/// Je me suis basé sur le CustomLabelStyle mais ça ne compile pas
/// Piste de réflexion: Gauge(value: configuration.value ...)
///

//struct CustomGaugeStyle: GaugeStyle {
//  func makeBody(configuration: Configuration) -> some View {
//    Gauge(configuration)
//      .foregroundColor(.red)
//  }
//}

struct GaugeModifier_Previews: PreviewProvider {
    static var previews: some View {
        GaugeModifier()
    }
}
