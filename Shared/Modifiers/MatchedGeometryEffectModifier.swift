//
//  MatchedGeometryEffectModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 04/07/2020.
//

import SwiftUI

/// Nouveau modifier qui permet de synchroniser l'animation de deux Views différentes
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Paramètres du modifier :
///   • id: ID ––> obligatoire
///   • namespace: @Namespace var ––> obligatoire
///   • properties: MatchedGeomtryProperties = .frame par défaut ––> optionnel
///   • anchor: UnitPoint = .center par ––> optionnel
///   • isSource : Bool = true par défaut ––> optionnel


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
          .fill(Color.red)
          .frame(width: 44, height: 44)
          .matchedGeometryEffect(id: "Shape", in: animation)
      }
    }
    /// Façon iOS 13, fade out / fade in (sans le matchedGeometryEffect)
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
            .fill(Color.blue)
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
//      BasicMatchedGeometryEffectModifier()
      AdvancedMatchedGeometryEffectModifier()
    }
  }
}
