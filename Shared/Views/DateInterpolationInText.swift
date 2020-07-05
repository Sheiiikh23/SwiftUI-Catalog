//
//  DateInterpolationInText.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import SwiftUI

/// Les Text peuvent désomais contenir des date sous différents style
/// Attention pas au format de la région par défaut
/// Plusieurs style possible. Le body n'est pas réinvoqué à chaque variation il s'agit en fait ± d'une animation.

// MARK: - Utilisation : Permet de manipuler des Dates dans une TextView avec tous les modifiers qui en découlent (font, fontWeight ...)

struct DateInterpolationInText: View {
  var body: some View {
    VStack {

      /// Deux dates différentes en ajoutant un delta de 600 sec (soit 10 min).
      Text(Date()...Date().addingTimeInterval(600))

      /// Date
      Text(Date().addingTimeInterval(600), style: .date)

      /// Heure
      Text(Date().addingTimeInterval(600), style: .time)

      /// Compte à rebours
      Text(Date().addingTimeInterval(600), style: .timer)

      /// Minuteur
      Text(Date().addingTimeInterval(600), style: .relative)
    }
  }
}

struct DateInterpolationInText_Previews: PreviewProvider {
  static var previews: some View {
    DateInterpolationInText()
  }
}
