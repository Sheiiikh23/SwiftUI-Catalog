//
//  GaugeView.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 07/12/2020.
//

import SwiftUI

/// Gauge représentant une value dans une range donnée (assez similaire au ProgessView)
/// Disponible sur : watchOS / Mac Catalyst
///
/// Il existe 2 types de gauges (comme les Progressview...) : en fonction du contexte
///   • linear : par défaut
///   • circular : ici, en forcant le gaugeStyle
/// Les comportements étant différents, j'ai créer deux struct pour bien voir les différences
/// Pour le gaugeStyle modifier cf : `GaugeStyleModifier`

// MARK: - Utilisation : Montrer la value dans une range donnée

struct LinearGaugeView: View {
  
  @State private var volumeValue: CGFloat = 0.5
  
  var body: some View {
    ScrollView {
      LazyVStack(spacing: 30) {
        
        // MARK: - Gauge avec label : Label non visible
        
        // Range par défaut (0...1)
        Gauge(value: volumeValue) {
          Text("Label")
        }
        
        // Range custom
        Gauge(value: volumeValue, in: 0...2) {
          Text("Label")
        }
        
        // MARK: - Gauge avec label & currentValue : Label non visible et currentValue à gauche de la gauge
        
        // Range par défaut
        Gauge(value: volumeValue) {
          Text("Label")
        } currentValueLabel: {
          Text("50%")
        }
        
        // Range custom
        Gauge(value: volumeValue, in: 0...2) {
          Text("Label")
        } currentValueLabel: {
          Text("50%")
        }
        
        // MARK: - Gauge avec Label & currentValue & markedValue : Label non visible, currentValue à gauche de la gauge, markedValue 🤔
        
        // Range par défaut
        Gauge(value: volumeValue) {
          Text("Label")
        } currentValueLabel: {
          Text("50%")
        } markedValueLabels: {
          Text("0%")
            .tag(0)
          Text("50%")
            .tag(0.5)
          Text("100%")
            .tag(1)
        }
        
        // Range custom
        Gauge(value: volumeValue, in: 0...2) {
          Text("Label")
        } currentValueLabel: {
          Text("50%")
        } markedValueLabels: {
          Text("0%")
            .tag(0)
          Text("50%")
            .tag(0.5)
          Text("100%")
            .tag(1)
        }
        
        
        // MARK: - Gauge avec Label & currentValue & minimum / maximum Value : Label non visible, minimumValue à gauche et maximumValue à droite de la gauge
        
        // Range par défaut
        Gauge(value: volumeValue) {
          Text("Label")
        } currentValueLabel: {
          Text("0.5")
        } minimumValueLabel: {
          Text("0%")
        } maximumValueLabel: {
          Text("100%")
        }
        
        // Range Custom
        Gauge(value: volumeValue, in: 0...2) {
          Text("Label")
        } currentValueLabel: {
          Text("0.5")
        } minimumValueLabel: {
          Text("0%")
        } maximumValueLabel: {
          Text("100%")
        }
        
        // MARK: - Gauge avec Label & currentValue & minimum / maximum Value & markedValue : Label non visible, minimumValue à gauche et maximumValue à droite de la gauge & markedValue 🤔
        
        // Range par défaut
        Gauge(value: volumeValue) {
          Text("Label")
        } currentValueLabel: {
          Text("50%")
        } minimumValueLabel: {
          Text("0%")
        } maximumValueLabel: {
          Text("100%")
        } markedValueLabels: {
          Text("0%")
            .tag(0.0)
          Text("50%")
            .tag(0.5)
          Text("100%")
            .tag(1.0)
        }
        
        // Range custom
        Gauge(value: volumeValue, in: 0...2) {
          Text("Label")
        } currentValueLabel: {
          Text("50%")
        } minimumValueLabel: {
          Text("0%")
        } maximumValueLabel: {
          Text("100%")
        } markedValueLabels: {
          Text("0%")
            .tag(0.0)
          Text("50%")
            .tag(0.5)
          Text("100%")
            .tag(1.0)
        }
      }
    }
  }
}

struct CiruclarGaugeView: View {
  
  @State private var volumeValue: CGFloat = 0.5
  
  var body: some View {
    ScrollView {
      LazyVStack(spacing: 30) {
        
        // MARK: - Gauge avec label : Label en bas de la gauge
        
        // Range par défaut (0...1)
        Gauge(value: volumeValue) {
          Text("Label")
        }
        .gaugeStyle(CircularGaugeStyle())
        
        // Range custom
        Gauge(value: volumeValue, in: 0...2) {
          Text("Label")
        }
        .gaugeStyle(CircularGaugeStyle())
        
        // MARK: - Gauge avec label & currentValue : Label en bas et currentValue au centre de la gauge
        
        // Range par défaut
        Gauge(value: volumeValue) {
          Text("Label")
        } currentValueLabel: {
          Text("50%")
        }
        .gaugeStyle(CircularGaugeStyle())
        
        // Range custom
        Gauge(value: volumeValue, in: 0...2) {
          Text("Label")
        } currentValueLabel: {
          Text("50%")
        }
        .gaugeStyle(CircularGaugeStyle())
        
        // MARK: - Gauge avec Label & currentValue & markedValue : Label en bas, currentValue au centre de la gauge, markedValue 🤔
        
        // Range par défaut
        Gauge(value: volumeValue) {
          Text("Label")
        } currentValueLabel: {
          Text("50%")
        } markedValueLabels: {
          Text("0%")
            .tag(0)
          Text("50%")
            .tag(0.5)
          Text("100%")
            .tag(1)
        }
        .gaugeStyle(CircularGaugeStyle())
        
        // Range custom
        Gauge(value: volumeValue, in: 0...2) {
          Text("Label")
        } currentValueLabel: {
          Text("50%")
        } markedValueLabels: {
          Text("0%")
            .tag(0)
          Text("50%")
            .tag(0.5)
          Text("100%")
            .tag(1)
        }
        .gaugeStyle(CircularGaugeStyle())
        
        
        // MARK: - Gauge avec Label & currentValue & minimum / maximum Value : Label non visible, minimumValue à gauche et maximumValue à droite de la gauge
        
        // Range par défaut
        Gauge(value: volumeValue) {
          Text("Label")
        } currentValueLabel: {
          Text("0.5")
        } minimumValueLabel: {
          Text("0%")
        } maximumValueLabel: {
          Text("100%")
        }
        .gaugeStyle(CircularGaugeStyle())
        
        // Range Custom
        Gauge(value: volumeValue, in: 0...2) {
          Text("Label")
        } currentValueLabel: {
          Text("0.5")
        } minimumValueLabel: {
          Text("0%")
        } maximumValueLabel: {
          Text("100%")
        }
        .gaugeStyle(CircularGaugeStyle())
        
        // MARK: - Gauge avec Label & currentValue & minimum / maximum Value & markedValue : Label non visible, minimumValue à gauche et maximumValue à droite de la gauge & markedValue 🤔
        
        // Range par défaut
        Gauge(value: volumeValue) {
          Text("Label")
        } currentValueLabel: {
          Text("50%")
        } minimumValueLabel: {
          Text("0%")
        } maximumValueLabel: {
          Text("100%")
        } markedValueLabels: {
          Text("0%")
            .tag(0.0)
          Text("50%")
            .tag(0.5)
          Text("100%")
            .tag(1.0)
        }
        .gaugeStyle(CircularGaugeStyle())
        
        // Range custom
        Gauge(value: volumeValue, in: 0...2) {
          Text("Label")
        } currentValueLabel: {
          Text("50%")
        } minimumValueLabel: {
          Text("0%")
        } maximumValueLabel: {
          Text("100%")
        } markedValueLabels: {
          Text("0%")
            .tag(0.0)
          Text("50%")
            .tag(0.5)
          Text("100%")
            .tag(1.0)
        }
        .gaugeStyle(CircularGaugeStyle())
      }
    }
  }
}

struct GaugeView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LinearGaugeView()
      CiruclarGaugeView()
    }
  }
}
