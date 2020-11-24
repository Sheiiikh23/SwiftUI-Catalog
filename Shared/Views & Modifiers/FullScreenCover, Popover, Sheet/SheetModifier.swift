//
//  SheetModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 04/07/2020.
//

import SwiftUI

/// SheetModifier permet de présenter une modale
/// Disponible sur : i•Pad•OS / watchOS / tvOS / MacOS / Mac Catalyst
///
/// Comportement qui diffèrent selon la plateforme

// MARK: - Utilisation : Permet de créer une modale

struct SheetModifier: View {

  @State private var openModal = false

  var body: some View {
    Button {
      self.openModal.toggle()
    } label: {
      Text("Open new modal presentation")
        .font(.title3)
        .fontWeight(.bold)
        .padding()
        .background(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
        .cornerRadius(15)
    }
    .sheet(isPresented: $openModal) {
      ModalPresenter()
    }
  }
}

fileprivate struct ModalPresenter: View {

  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    ZStack {
      Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)).edgesIgnoringSafeArea(.all)
      Text("Welcome to the new modal presentation")
        .font(.title2)
        .fontWeight(.heavy)
        .foregroundColor(.red)
        .multilineTextAlignment(.center)
        .lineSpacing(25)
        .padding()
        .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
        .cornerRadius(15)
        .shadow(radius: 15)
    }
    .onTapGesture {
      presentationMode.wrappedValue.dismiss()
    }
  }
}


struct SheetModifier_Previews: PreviewProvider {
  static var previews: some View {
    SheetModifier()
  }
}
