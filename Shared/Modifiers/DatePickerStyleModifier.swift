//
//  DatePickerStyleModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 04/07/2020.
//

import SwiftUI

/// Nouveau DatePickerStyle pour les DatePicker
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
///   • DefaultDatePickerStyle ––> pour les 3
///   • WheelDatePickerStyle ––> pour i•Pad•OS / Mac Catalyst
///   • FieldDatePickerStyle ––> macOS uniquement
///   • GrapicalDatePickerStyle –––> pour les 3
///   • StepperFieldDatePickerStyle ––> macOS uniquement
/// (je n'ai pas fais de View pour ce présent uniquement sur macOS)

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

struct GraphicalDatePickerStyleModifier: View {

  @State private var date = Date()

  var body: some View {
    VStack {
      Text("Enter your birthday")
        .font(.largeTitle)
      DatePicker("Enter your birthday", selection: $date)
        .datePickerStyle(GraphicalDatePickerStyle())
        .labelsHidden()
        .frame(height: 400)
    }
  }
}

struct DefaultDatePickerStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DefaultDatePickerStyleModifier()
      WheelDatePickerStyleModifier()
      GraphicalDatePickerStyleModifier()
    }
  }
}
