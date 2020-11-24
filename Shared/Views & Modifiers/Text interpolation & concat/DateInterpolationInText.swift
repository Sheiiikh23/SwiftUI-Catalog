//
//  DateInterpolationInText.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import SwiftUI

/// Les Text peuvent désomais contenir des dates sous différents style
/// Le body n'est pas réinvoqué à chaque variation il s'agit en fait ± d'une animation.
/// Vu que la date est dans un Text on puet donc appliquer des modifiers de text

// MARK: - Utilisation : Permet d'afficher des Dates sans avoir à passer par des DateFormatter

struct DateInterpolationInText: View {
  var body: some View {
    VStack(spacing: 20) {

      /// Deux dates différentes en ajoutant un delta de 600 sec (soit 10 min).
      Text(Date()...Date().addingTimeInterval(600))
        .font(.title3)
        .fontWeight(.bold)

      /// Date
      Text(Date().addingTimeInterval(600), style: .date)
        .font(.caption)
        .fontWeight(.thin)

      /// Heure
      Text(Date().addingTimeInterval(600), style: .time)
        .font(.headline)
        .fontWeight(.heavy)

      /// Compte à rebours
      Text(Date().addingTimeInterval(600), style: .timer)
        .foregroundColor(.red)

      /// Minuteur
      Text(Date().addingTimeInterval(600), style: .relative)
        .underline()
    }
  }
}

struct DateInterpolationInText_Previews: PreviewProvider {
  static var previews: some View {
    DateInterpolationInText()
  }
}
