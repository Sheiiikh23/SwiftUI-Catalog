//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Modifier propre pour les GroupBox :
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// GroupBoxStyle présents nativement :
///  • DefaultGroupBoxStyle : style par défaut
///
/// Créer un GroupBoxStyle custom :
///  • struct conform au protocol GroupBoxStyle : fonction makeBody

// MARK: - Utilisation : Custom la UI d'un GroupBox

struct GroupBoxStyleModifier: View {

  var body: some View {
    VStack(spacing: 50) {

      // MARK: - DefautlGroupBoxStyle
      GroupBox(
        label: Label("Étages montés", systemImage: "flame.fill")
          .foregroundColor(.orange)
      ) {
        Text("13 ")
          .font(.title)
          .fontWeight(.bold)
        +
        Text("étages")
          .font(.title3)
          .fontWeight(.semibold)
      }
      .groupBoxStyle(DefaultGroupBoxStyle())

      // MARK: - Custom
      GroupBox(
        label: Label("Étages montés", systemImage: "flame.fill")
          .foregroundColor(.orange)
      ) {
        Text("13 ")
          .font(.title)
          .fontWeight(.bold)
        +
        Text("étages")
          .font(.title3)
          .fontWeight(.semibold)
      }
      .groupBoxStyle(LeadingGroupBoxStyle())

      GroupBox(
        label: Label("Étages montés", systemImage: "flame.fill")
          .foregroundColor(.orange)
      ) {
        Text("13 ")
          .font(.title)
          .fontWeight(.bold)
        +
        Text("étages")
          .font(.title3)
          .fontWeight(.semibold)
      }
      .groupBoxStyle(RowGroupBoxStyle())
    }
  }
}

struct LeadingGroupBoxStyle: GroupBoxStyle {

  func makeBody(configuration: Configuration) -> some View {
    HStack {
      VStack(alignment: .leading) {
        configuration.label
        configuration.content
      }
      Spacer()
    }
    .padding()
    .background(Color.purple.opacity(0.33))
    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    .padding()
  }
}

struct RowGroupBoxStyle: GroupBoxStyle {

  func makeBody(configuration: Configuration) -> some View {
    HStack {
      configuration.label
      Spacer()
      configuration.content
        .foregroundColor(.yellow)
    }
    .padding()
    .background(Color.red.opacity(0.33))
    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    .padding()
  }
}

struct GroupBoxStyleModifier_Previews: PreviewProvider {
  static var previews: some View {
    GroupBoxStyleModifier()
      .preferredColorScheme(.dark)
  }
}
