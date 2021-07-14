//
//  NamespaceWrapper.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 04/07/2020.
//

import SwiftUI

/// @Namespace permet de store les id de View
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// À utiliser avec le modifier matchedGeometryEffect : cf matchedGeometryEffect modifier
/// Pour passer un @Namespace à des subview il faut passer par le Namespace.ID : cf NamespaceWrapperSubView

// MARK: - Utilisation : Utilisation avec le modifier matchedGeometryEffect

struct NamespaceWrapper: View {

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

// A tester sur device / simu car ne fonctionne pas pour la preview
struct NamespaceWrapperSubView: View {

  @State private var isExpanded = false
  @Namespace private var namespace

  var body: some View {
    Group() {
      if isExpanded {
        VerticalView(namespace: namespace)
      } else {
        HorizontalView(namespace: namespace)
      }
    }
    .onTapGesture {
      withAnimation(.spring()) { isExpanded.toggle() }
    }
  }
}

struct VerticalView: View {

  var namespace: Namespace.ID

  var body: some View {
    VStack {
      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(Color.pink)
        .frame(width: 60, height: 60)
        .matchedGeometryEffect(id: "rect", in: namespace)
      Text("Hello SwiftUI!").fontWeight(.semibold)
        .matchedGeometryEffect(id: "text", in: namespace)
    }
  }
}

struct HorizontalView: View {

  var namespace: Namespace.ID

  var body: some View {
    HStack {
      Text("Hello SwiftUI!").fontWeight(.semibold)
        .matchedGeometryEffect(id: "text", in: namespace)
      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(Color.pink)
        .frame(width: 60, height: 60)
        .matchedGeometryEffect(id: "rect", in: namespace)
    }
  }
}

struct NamespaceWrapper_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NamespaceWrapper()
      NamespaceWrapperSubView()
    }
  }
}
