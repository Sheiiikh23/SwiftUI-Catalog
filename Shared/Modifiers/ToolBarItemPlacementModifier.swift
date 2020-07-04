//
//  ToolBarItemPlacementModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

/// ToolBarItemPlacement modifier
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
/// 
/// Voici les ToolBarItemPlacement présent nativement (cf watchExtension):
///   • automatique ––> comportement propre à la plateforme
///   • bottomBar ––> item placé dans la bottom toolbar
///   • cancellationAction ––> représente un bouton Cancel – comportement propre à la plateforme ??
///   • confirmationAction ––> représente un bouton de confirmation d'action (du style confirmer) – comportement propre à la plateforme ??
///   • destructiveAction ––> représente un bouton de destruction d'action (du style supprimer / ne pas enregistrer) avant de quitter la view – comportement propre à la plateforme ??
///   • navigation ––> représente une action de navigation (du style suivant / précédent)
///   • navigationBarLeading ––> item placé au leading de la navigationBar
///   • navigationBarTrailing ––> item placé au trailing de la navigationBar
///   • primaryAction ––> représente une action fréquemment utilisé en fonction du contexte ?? – comportement propre à la plateforme ??
///   • principal ––> représente une action principal – propre à la plateforme ? Très utile pour les iPad car au centre de la vue et de la navigationView
///   • status ––> représente un item de nature informationelle ne représentant pas une action pouvant être entrepris par l'utilisateur – propre à la plateforme ??


#warning("Normalement dispo pour watchOS. Regarder les updates de la doc")
#warning("Lever les incertitudes. Atteinte de la doc...")

struct AutomaticPlacement: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("Automatic")
      .toolbar {
        ToolbarItem(placement: .automatic) {
          Text("Automatic placement")
        }
      }
    }
  }
}

struct BottomBarPlacement: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("BottomBar")
      .toolbar {
        ToolbarItem(placement: .bottomBar) {
          Text("BottomBar placement")
        }
      }
    }
  }
}

/// Activer / désactiver la Live Preview
struct CancellationAction: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("CancellationAction")
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Text("CancellationAction placement")
        }
      }
    }
  }
}

/// Activer / désactiver la Live Preview
struct ConfirmationAction: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("ConfirmationAction")
      .toolbar {
        ToolbarItem(placement: .confirmationAction) {
          Text("ConfirmationAction placement")
        }
      }
    }
  }
}

/// Activer / désactiver la Live Preview
struct DestructiveAction: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("DestructiveAction")
      .toolbar {
        ToolbarItem(placement: .destructiveAction) {
          Text("DestructiveAction placement")
        }
      }
    }
  }
}

struct Navigation: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("Navigation")
      .toolbar {
        ToolbarItem(placement: .navigation) {
          Text("Navigation placement")
        }
      }
    }
  }
}

struct NavigationBarLeading: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("NavigationBarLeading")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Text("NavigationBarLeading placement")
        }
      }
    }
  }
}

struct NavigationBarTrailing: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("NavigationBarTrailing")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Text("NavigationBarTrailing placement")
        }
      }
    }
  }
}

struct PrimaryAction: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("PrimaryAction")
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          Text("PrimaryAction placement")
        }
      }
    }
  }
}

struct Principal: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("Principal")
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("Principal placement")
        }
      }
    }
  }
}

struct Status: View {
  var body: some View {
    NavigationView {
      List(0...50, id: \.self) { item in
        Text("Hello row n°\(item)")
          .font(.title3)
          .fontWeight(.bold)
      }
      .navigationBarTitle("Status")
      .toolbar {
        ToolbarItem(placement: .status) {
          Text("Status placement")
        }
      }
    }
  }
}


struct ToolBarItemPlacementModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AutomaticPlacement()
      BottomBarPlacement()
      CancellationAction()
      ConfirmationAction()
      DestructiveAction()
      Navigation()
      NavigationBarLeading()
      NavigationBarTrailing()
      PrimaryAction()
      Group {
        Principal()
        Status()
      }
    }
  }
}
