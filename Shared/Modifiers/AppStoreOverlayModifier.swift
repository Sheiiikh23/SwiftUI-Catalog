//
//  AppStoreOverlayModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import StoreKit
import SwiftUI

/// Nouveau modifier qui permet d'afficher une bannière pour recommander une app
/// Disponible sur : i•Pad•OS
///
/// Importer StoreKit
/// Paramètres du modifier :
///   • isPresented: *Binding* Bool ––> obligatoire
///   • configuration: closure ––> obigatoire (@escaping par défaut)

struct AppStoreOverlayModifier: View {

  @State private var showRecommandedApp = true

    var body: some View {
      ZStack {
        Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)).edgesIgnoringSafeArea(.all)
        Button {
          self.showRecommandedApp.toggle()
        } label: {
          Text("Show recommanded app in a banner")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.purple)
            .padding()
            .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)).opacity(0.5))
            .cornerRadius(15)
            .shadow(radius: 15)
        }
      }

//      .edgesIgnoringSafeArea(.all)
      .appStoreOverlay(isPresented: $showRecommandedApp) {

        /// Overlay qui permet d'afficher la bannière de l'app recommandée
        /// appIdentifier: id de l'app 
        /// Deux positions possibles :
        ///   • bottom : le plus bas tout en respectant la safe area bottom (même si ignoré)
        ///   • bottomRaised : plus haut le bottom de genre 10-15 points
        SKOverlay.AppConfiguration(appIdentifier: "1440611372", position: .bottom)
      }
    }
}

struct AppStoreOverlayModifier_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreOverlayModifier()
    }
}
