//
//  DatePickerView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/02/2021.
//

import SwiftUI

/// DatePicker qui est un picker spécifique pour les Date
/// Disponible sur : i•Pad•OS / macOS / Mac Cataclyst
///
/// Prend toute la width du parent container par défaut
/// Il faut obligatoirement provider deux paramètres : titre & selection ou selection & label
/// On peut rajouter à cela, les paramètres:
///   • in range : Range de dates sélectionnables – par défaut : toutes les dates
///   • displayedComponents : permet de pouvoir setter uniquement une date ou heure – par défaut : les deux
///     • date : date uniquement
///     • hourAndMinute : heures et minutes

// MARK: - Utilisation : DatePicker pour la sélection d'une date / heure par l'utilisateur

struct DatePickerView: View {

  @State private var birthDate = Date()

  var body: some View {
    VStack(spacing: 20) {

      // MARK: - String en tant que Title
      VStack {
        Text("String as a title")
          .font(.title)
          .fontWeight(.black)

        /// Title & selection
        DatePicker("Birthdate", selection: $birthDate)

        /// Title & selection & range
        DatePicker("Birthdate with range", selection: $birthDate, in: ...Date())

        /// Title & selection & displayedComponents
        DatePicker("Birthdate with date components", selection: $birthDate, displayedComponents: .date)
        DatePicker("Birthdate with hoursAndMinutes components", selection: $birthDate, displayedComponents: .hourAndMinute)

        // Title & selection & range & displayedComponents
        DatePicker("Birthdate with range & date components", selection: $birthDate, in: ...Date(), displayedComponents: .date)
        DatePicker("Birthdate with hoursAndMinutes components", selection: $birthDate, in: ...Date(), displayedComponents: .hourAndMinute)
      }

      // MARK: - View en tant que Label
      VStack {
        Text("View as a label")
          .font(.title)
          .fontWeight(.black)

        /// Selection & label
        DatePicker(selection: $birthDate) {
          Label("Birthdate", systemImage: "figure.wave")
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.pink.opacity(0.33))
            .cornerRadius(8)
        }

        /// Selection & range & label
        DatePicker(selection: $birthDate, in: ...Date()) {
          Label("Birthdate with range", systemImage: "figure.wave")
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.pink.opacity(0.33))
            .cornerRadius(8)
        }

        /// Selection & displayedComponents & label
        DatePicker(selection: $birthDate, displayedComponents: .date) {
          Label("Birthdate with date components", systemImage: "figure.wave")
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.pink.opacity(0.33))
            .cornerRadius(8)
        }
        DatePicker(selection: $birthDate, displayedComponents: .hourAndMinute) {
          Label("Birthdate with hoursAndMinutes components", systemImage: "figure.wave")
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.pink.opacity(0.33))
            .cornerRadius(8)
        }

        /// Selection & range & displayedComponents & label
        DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
          Label("Birthdate with range & date components", systemImage: "figure.wave")
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.pink.opacity(0.33))
            .cornerRadius(8)
        }
        DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .hourAndMinute) {
          Label("Birthdate with hoursAndMinutes components", systemImage: "figure.wave")
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.pink.opacity(0.33))
            .cornerRadius(8)
        }
      }
    }
  }
}

struct DatePickerView_Previews: PreviewProvider {
  static var previews: some View {
    DatePickerView()
  }
}
