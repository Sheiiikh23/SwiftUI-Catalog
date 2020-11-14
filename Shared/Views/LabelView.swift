//
//  LabelView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

/// Labels : concaténation d'une Image / Shape avec un Text
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Le spacing de la concaténation est automatiquement géré par l'OS
/// Dans une toolbar ne montre que l'Image / Shape et le Text sert pour l'accessibilité

// MARK: - Utilisation : TabItems (évitant un VStack) et éviter de créer des HStacks

struct LabelView: View {
  var body: some View {
    NavigationView {
      
      VStack(spacing: 50) {

        /// Label avec une String en tant que Title et une Image Asset en tant qu'image
        Label("Constructeur", image: "Twitter")

        /// Label avec une String en tant que Title et une systemImage (= SFSymbols) en tant qu'image
        Label("Constructeur", systemImage: "magnifyingglass")
          /// Permet de les faire scale de la même manière
          .font(.system(size: 20, weight: .semibold))

        /// Label plus générique :
        /// Text en tant que Text ––> plus personnalisable
        /// Icon en tant qu'Image ––> plus personnalisable
        Label {
          Text("Constructeur")
            .font(.callout)
            .fontWeight(.bold)
            .foregroundColor(.red)
        } icon: {
          Image("Twitter")
            .resizable()
            .frame(width: 35, height: 35)
        }

        /// Label plus générique :
        /// Text en tant que Text ––> plus personnalisable
        /// Icon en tant que systemImage ––> plus personnalisable
        Label {
          Text("Constructeur")
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(.green)
        } icon: {
          Image(systemName: "trash.circle.fill")
            .renderingMode(.original)
            .font(.system(size: 40, weight: .heavy))
        }

        /// Label plus générique :
        /// Text en tant que Text ––> plus personnalisable
        /// Icon en tant que Shape ––> pas possible sans le Label générique
        Label {
          Text("Constructeur")
            .font(.system(size: 20, weight: .heavy, design: .rounded))
            .foregroundColor(.orange)
        } icon: {
          Circle()
            .fill(Color.green)
            .frame(width: 32, height: 32)
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.gray)
      .navigationBarTitle("Hello Labels")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {}) {
            // La view ne montre que l'image / systemImage • Shape
            // Le Text du label est servie pour l'accessibilité pour les personnes malvoyantes
            Label("Progress", systemImage: "pencil")
          }
        }
      }
    }
  }
}


struct LabelView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LabelView()
      LabelView()
        .environment(\.sizeCategory, .extraLarge)
    }
  }
}
