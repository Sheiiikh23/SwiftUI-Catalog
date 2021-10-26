//
//  WidgetFamily.swift
//  iOS
//
//  Created by Lucas Abijmil on 01/12/2020.
//

import SwiftUI
import WidgetKit

/// widgetFamily permet d'indiquer la taille du Widget
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst (WidgetKit doit être importé)
///
/// widgetFamily: WidgetFamily { get }
/// Actuellement trois tailles disponible :
///   • systemSmall
///   • systemMedium
///   • systemLarge
/// On peut notamment utiliser ces tailles pour :
///   • provide des View différentes en fonctions de la taille du Widget (pour le même Widget)
///   • indiquer quelles tailles supporte le widget via le modifier .supportedFamilies

// MARK: - Importance pour l'accessibilité : très faible – faible
// MARK: - Utilisation : Pour provide des Views différentes en fonction de la taille du Widget (pour le même Widget)

struct WidgetFamily: View {

  @Environment(\.widgetFamily) private var widgetFamily

  var body: some View {
    switch widgetFamily {
    case .systemSmall:
      Text("Small widget size")
    case .systemMedium:
      Text("Medium widget size")
        .font(.title3)
        .fontWeight(.semibold)
    case .systemLarge:
      Text("Large widget size")
        .font(.title)
        .fontWeight(.heavy)
        .foregroundColor(.red)
    case .systemExtraLarge:
      #warning("FIXME")
      Text("FIXME")
    @unknown default:
      fatalError("A new widget size was added by Apple")
    }
  }
}
