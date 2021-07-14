//
//  MatchedGeometryEffectModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 04/07/2020.
//

import SwiftUI

/// MatchedGeometryEffect permet de synchroniser l'animation de deux Views différentes en fonction d'une condition
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// /!\ Ce modifier fonctionne uniquement avec l'utilisation de if / else /!\
///
/// Pour synchroniser les animation le modifier à au minimum besoin :
///   • id : permet de déclarer que tel View et tel View sont les mêmes
///   • namespace : permet de storer les id des View
///
/// On peut un plus personnaliser l'animation en changeant ces valeurs
///   • properties = .frame (par défaut)
///   • anchor: UnitPoint = .center (par défaut)
///   • isSource = true (par défaut)
///
/// On peut utiliser plusieurs matchedGeometryEffect avec des id ou @Namespace différent pour la même View

// MARK: - Utilisation : Synchronisation d'animations avec un possible changement de layout

struct BasicMatchedGeometryEffectModifier: View {

  @Namespace private var animation
  @State private var isFlipped = false

  var body: some View {
    VStack {
      if isFlipped {
        Circle()
          .fill(Color.red)
          .frame(width: 44, height: 44)
          .matchedGeometryEffect(id: "Shape", in: animation)
        Text("Talyor Swift – 1989")
          .font(.headline)
          .matchedGeometryEffect(id: "Text", in: animation)
      } else {
        Text("Talyor Swift – 1989")
          .font(.headline)
          .matchedGeometryEffect(id: "Text", in: animation)
        Circle()
          .fill(Color.green)
          .frame(width: 44, height: 44)
          .matchedGeometryEffect(id: "Shape", in: animation)
      }
    }
    .onTapGesture { withAnimation { self.isFlipped.toggle() } }
  }
}

struct AdvancedMatchedGeometryEffectModifier: View {

  @Namespace private var animation
  @State private var isZoomed = false
  var frame: CGFloat {
    isZoomed ? 300 : 44
  }

  var body: some View {
    VStack {
      Spacer()
      VStack {
        HStack {
          RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(Color.red)
            .frame(width: frame, height: frame)
            .padding(.top, isZoomed ? 20 : 0)
          if !isZoomed {
            Text("Taylor Swift – 1989")
              .font(.headline)
              .matchedGeometryEffect(id: "text", in: animation)
            Spacer()
          }
        }
        if isZoomed {
          Text("Taylor Swift – 1989")
            .font(.headline)
            .matchedGeometryEffect(id: "text", in: animation)
            .padding(.bottom, 60)
          Spacer()
        }
      }
      .onTapGesture {
        withAnimation(.spring()) {
          self.isZoomed.toggle()
        }
      }
      .padding()
      .frame(maxWidth: .infinity)
      .frame(height: isZoomed ? 400 : 60)
      .background(Color(white: 0.9))
    }
  }
}

struct MachedGeometryEffectModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      BasicMatchedGeometryEffectModifier()
      AdvancedMatchedGeometryEffectModifier()
    }
  }
}
