//
//  AppStoreOverlayModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import SwiftUI
import StoreKit


/// AppStoreOverlay qui permet de montrer une bannière pour recommander une app
/// Disponible sur : i•Pad•OS
///
/// Importer StoreKit
/// Paramètres du modifier :
///   • isPresented: *Binding* Bool ––> obligatoire
///   • configuration: SKOverlay.AppConfiguration(appIdentifier: appId, position: position)
///     - appId: String correspondant à l'ID de l'app
///     - position : .bottom ou .bottomRaised


// MARK: Utilisation : Recommander d'autres applications ou dans AppClip pour montrer l'app en entière


struct AppStoreOverlayModifier: View {

  @State private var showRecommandedApp = true

  var body: some View {
    Button { showRecommandedApp.toggle() } label: {
      Text("Show recommanded app in a banner")
        .font(.title2)
        .fontWeight(.bold)
        .foregroundColor(.purple)
        .padding()
        .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)).opacity(0.5))
        .cornerRadius(15)
        .shadow(radius: 15)
    }
    .appStoreOverlay(isPresented: $showRecommandedApp) {
      /// Overlay qui permet d'afficher la bannière de l'app recommandée
      /// appIdentifier: id de l'app
      /// Deux positions possibles :
      ///   • bottom : le plus bas tout en respectant la safe area bottom (même si ignoré)
      ///   • bottomRaised : plus haut le bottom de genre 10-15 points
      SKOverlay.AppConfiguration(appIdentifier: "1440611372", position: .bottom)
    }
    .ignoresSafeArea()
  }
}

struct AppStoreOverlayModifier_Previews: PreviewProvider {
  static var previews: some View {
    AppStoreOverlayModifier()
  }
}
