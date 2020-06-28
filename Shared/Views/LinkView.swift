//
//  LinkView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

/// Apparition des Link: redirige vers un site / appli
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Deux construteurs :
///   • Link(String, destination: URL)
///   • Link(destination: URL) ...
///
/// Peut ouvrir des URLs classique dans Safari (siteApple)
/// Peut ouvrirdes universal link afin d'ouvrir une App (wwdcAnnouncement redirige vers l'app News)


struct LinkView: View {

  let siteApple = URL(string: "https://developer.apple.com/tutorials/swiftui/")!
  let wwdcAnnouncement = URL(string: "https://apple.news/AjriX1CWUT-OfjXu_R4QsnA")!

  var body: some View {
    VStack(spacing: 30) {
      /// Constructeur "compact"
      Link("Site d'Apple", destination: siteApple)
        .font(.title3)
        .padding()
        .background(Color.orange.opacity(0.5))
        .cornerRadius(20)

      /// Constructeur permettant plus de custom
      Link(destination: wwdcAnnouncement) {
        Text("Voir les annonces de la WWDC 20")
          .font(.title3)
          .fontWeight(.bold)
          .foregroundColor(.black)
          .padding()
          .background(Color.pink.opacity(0.5))
          .cornerRadius(20)
      }
    }
  }
}

struct LinkView_Previews: PreviewProvider {
  static var previews: some View {
    LinkView()
  }
}
