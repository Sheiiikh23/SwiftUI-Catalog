//
//  EnvironmentPresentationMode.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import SwiftUI

/// presentationMode premet de dismiss des modales, navigationView etc...
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// prensentationMode: Binding<PrensentationMode> { get }
/// On passe par la wrappedValue pour accéder à la value et à la fonction
/// Ex :
///   • wrappedValue.isPresented : Bool ––> indique si une vue est actuellement présenté
///   • wrappedValue.dismmiss() ––> Dismiss la vue si actuellement présentée

// MARK: - Importance pour l'accessibilité : faible
// MARK: - Utilisation : À utiliser notamment pour des boutons types dismiss etc... (super utile !)

struct PresentationMode: View {

  @Environment(\.presentationMode) private var prensetationMode
  @State private var showModal = false
  @State private var showFullScreenCover = false

  var body: some View {
    VStack {
      Button { showModal.toggle() } label: { Text("Show modal presentation") }
        .sheet(isPresented: $showModal) { ModalPresenter() }
      Button { showFullScreenCover.toggle() } label: { Text("Show full screen cover presentation") }
        .fullScreenCover(isPresented: $showFullScreenCover) { ModalPresenter() }
    }
  }
}

fileprivate struct ModalPresenter: View {

  @Environment(\.presentationMode) private var presentationMode

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

struct EnvironmentPresentationMode_Previews: PreviewProvider {
  static var previews: some View {
    PresentationMode()
  }
}


