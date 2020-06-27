//
//  GaugeView.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// Apparition des Gauges sous formes d'arc de cercle représentant une value dans une range
/// Disponible sur: watchOS

/// Plusieurs constructeurs diponibles avec un range par défaut de 0...1:
///   • Gauge(value: , label: View)
///   • Gauge(value: , label: View, currentValueLabel: View)
///   • Gauge(value: , label: View, currentValueLabel: View, minimumValueLabel: View, maximumValueLabel: View)
///   • Gauge(value: , label: View, currentValueLabel: View, markedValueLabels: ViewBuilder) ??
///   • Gauge(value: , label: View, currentValueLabel: View, minimumValueLabel: View, maximumValueLabel: View, markedValueLabels: ViewBuilder) ??
///
/// On peut rajouter à tous ces constructeurs une range custom
///   • Gauge(value: , in: Min...Max, ...)
///
/// Modifiers notables sur cette View:
///   • foregroundColor ––> effectif uniquement sur les CircularGauge
///
/// J'ai pas compris le system des markedValueLabels, update à venir 

#warning("Pas mal de bug encore. Regarder les prochaines updates. Lever l'incertitude concernant le markedValueLabels")
struct GaugeView: View {

  @State private var volumeValue: CGFloat = 0.5

  var body: some View {
    ScrollView {

      VStack(spacing: 20) {

        // MARK: - LinearGauge

        /// Constructeur le plus basique
        /// Range par défaut: 0...1
        Gauge(value: volumeValue) {
          /// Le label de la gauge n'est pas affiché pour le moment | Censé l'être ? 
          Label("Volume", systemImage: "drop.fill")
        }
        .foregroundColor(Color.pink.opacity(0.5)) /// Modifier non appliqué sur les Gauge Linéaire
        .accentColor(.green)
        .padding()
        .background(Color.red)

        /// Constructeur avec l'affichage de la currentValue
        /// Range custom
        Gauge(value: volumeValue, in: 0...2) {
          /// Le label de la gauge n'est pas affiché pour le moment | Censé l'être ?
          Label("Volume", systemImage: "drop.fill")
        } currentValueLabel: {
          Text("\(volumeValue, specifier: "%.1f")").foregroundColor(.white)
        }
        .accentColor(.green)
        .padding()
        .background(Color.red)

        /// Constructeur avec l'affichage de la minimum / maximum value
        /// Range custom
        Gauge(value: volumeValue, in: 0...2) {
          /// Le label de la gauge n'est pas affiché pour le moment | Censé l'être ?
          Label("Volume", systemImage: "drop.fill")
        } currentValueLabel: { /// la currentValue n'est pas affiché | Censé l'être ?
          Text("\(volumeValue, specifier: "%.1f")")
            .foregroundColor(.white)
        } minimumValueLabel: {
          Text("0")
            .foregroundColor(.white)
        } maximumValueLabel: {
          Text("2")
            .foregroundColor(.white)
        }
        .foregroundColor(.pink)
        .accentColor(.green)
        .padding()
        .background(Color.red)



        // MARK: - CircularGauge

        /// Constructeur le plus basique
        /// Range par défaut: 0...1
        Gauge(value: volumeValue) {
          /// Le Label pas affiché mais est censé l'être (entre le début et la fin du gauge)
          Label("Volume", systemImage: "drop.fill")
        }
        .gaugeStyle(CircularGaugeStyle())
        .foregroundColor(Color.pink.opacity(0.5))
        .accentColor(.green)

        /// Constructeur avec l'affichage de la currentValue
        /// Range custom
        Gauge(value: volumeValue, in: 0...2) {
          /// Le Label pas affiché mais est censé l'être (entre le début et la fin du gauge)
          Label("Volume", systemImage: "drop.fill")
        } currentValueLabel: {
          Text("\(volumeValue, specifier: "%.1f")")
        }
        .gaugeStyle(CircularGaugeStyle())
        .foregroundColor(Color.pink.opacity(0.5))
        .accentColor(.green)

        /// Constructeur avec l'affichage de la minimum / maximum value
        /// Range custom
        Gauge(value: volumeValue, in: 0...2) {
          /// Pas affiché et n'est pas censé l'être
          Label("Volume", systemImage: "drop.fill")
        } currentValueLabel: {
          Text("\(volumeValue, specifier: "%.1f")")
        } minimumValueLabel: {
          Text("0")
        } maximumValueLabel: {
          Text("2")
        }
        .gaugeStyle(CircularGaugeStyle())
        .foregroundColor(Color.pink.opacity(0.5))
        .accentColor(.green)
      }
    }
  }
}

struct Gauge_Previews: PreviewProvider {
  static var previews: some View {
    GaugeView()
  }
}
