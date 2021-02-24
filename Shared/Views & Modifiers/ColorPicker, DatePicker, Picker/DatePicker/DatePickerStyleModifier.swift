//
//  DatePickerStyleModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 04/07/2020.
//

import SwiftUI

/// DatePickerStyle pour définir le style d'un DatePicker
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
///   • DefaultDatePickerStyle : style par défaut en fonction de la plateforme
///   • CompactDatePickerStyle : pour les 3 (format textuel a utilisé lorsque l'espace est petit dans une pop-up 👍)
///   • FieldDatePickerStyle ––> macOS uniquement (date & heure spécifique. Mais devrait utilisé le StepperStyle à moins qu'on doit caché le stepper)
///   • GrapicalDatePickerStyle –––> pour les 3 (parcourir des mois / années 👌)
///   • StepperFieldDatePickerStyle ––> macOS uniquement (date & heure spécifique avec un stepper pour faire varier les variables)
///   • WheelDatePickerStyle ––> pour i•Pad•OS / Mac Catalyst (old style 🤮)

// MARK: - Utilisation: Custom la UI d'un DatePicker 

struct DefaultDatePickerStyleModifier: View {

  @State private var date = Date()

  var body: some View {
    VStack {
      Text("Enter your birthday")
        .font(.largeTitle)
      DatePicker("Enter your birthday", selection: $date)
        .datePickerStyle(DefaultDatePickerStyle())
        .labelsHidden()
        .frame(height: 400)
    }
  }
}

struct CompactDatePickerStyleModifier: View {

  @State private var date = Date()

  var body: some View {
    VStack {
      Text("Enter your birthday")
        .font(.largeTitle)
      DatePicker("Enter your birthday", selection: $date)
        .datePickerStyle(CompactDatePickerStyle())
        .labelsHidden()
        .frame(height: 400)
    }
  }
}

#if os(macOS)
struct FieldDatePickerStyleModifier: View {

  @State private var date = Date()

  var body: some View {
    VStack {
      Text("Enter your birthday")
        .font(.largeTitle)
      DatePicker("Enter your birthday", selection: $date)
        .datePickerStyle(FieldDatePickerStyle())
        .labelsHidden()
        .frame(height: 400)
    }
  }
}
#endif

struct GraphicalDatePickerStyleModifier: View {

  @State private var date = Date()

  var body: some View {
    VStack {
      Text("Enter your birthday")
        .font(.largeTitle)
      DatePicker("Enter your birthday", selection: $date)
        .datePickerStyle(GraphicalDatePickerStyle())
        .labelsHidden()
    }
  }
}

#if os(macOS)
struct StepperFieldDatePickerStyleModifier: View {

  @State private var date = Date()

  var body: some View {
    VStack {
      Text("Enter your birthday")
        .font(.largeTitle)
      DatePicker("Enter your birthday", selection: $date)
        .datePickerStyle(StepperFieldDatePickerStyle())
        .labelsHidden()
        .frame(height: 400)
    }
  }
}
#endif

struct WheelDatePickerStyleModifier: View {

  @State private var date = Date()

  var body: some View {
    VStack {
      Text("Enter your birthday")
        .font(.largeTitle)
      DatePicker("Enter your birthday", selection: $date)
        .datePickerStyle(WheelDatePickerStyle())
        .labelsHidden()
        .frame(height: 400)
    }
  }
}

struct DefaultDatePickerStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DefaultDatePickerStyleModifier()
      CompactDatePickerStyleModifier()
      GraphicalDatePickerStyleModifier()
      WheelDatePickerStyleModifier()
    }
  }
}
