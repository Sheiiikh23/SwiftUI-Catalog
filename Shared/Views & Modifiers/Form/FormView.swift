//
//  FormView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 22/02/2021.
//

import SwiftUI

/// Form : Formulaire / conteneur permettant de regrouper des contrôles pour la saisie de données (TextField, Picker etc...)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// SwiftUI créer un rendu différent selon la plateforme
/// L'utilisation de Section peut être très utile pour séparer la logique de saisie de données (cf SectionView)

// MARK: - Utilisation : Créer un formulaire pour la saisie de données

struct FormView: View {
  @State private var firstName = ""
  @State private var lastName = ""
  @State private var birthday = Date()
  @State private var favoriteColor = Color.white
  @State private var isBlind = false
  @State private var wtfStory = ""

  var body: some View {
    Form {
      Section(header: Text("Infos persos"))  {
        TextField("Prénom", text: $firstName)
        TextField("Nom", text: $lastName)
        DatePicker("Date de naissance", selection: $birthday, in: ...Date(), displayedComponents: .date)
      }
      Section(header: Text("Ta couleur préférée").foregroundColor(.red),
              footer: Label("Beaucoup de gens sont touchés", systemImage: "eyeglasses")) {
        ColorPicker("Clique ici pour choisir ta couleur", selection: $favoriteColor)
        Toggle("As tu un problème de vue", isOn: $isBlind)
          .toggleStyle(SwitchToggleStyle(tint: .purple))
      }
      Section(header: Text("Des trucs wtf à nous raconter ? ").fontWeight(.black),
              footer: Text("WOUAH impressionnant !").opacity(wtfStory.isEmpty ? 0 : 1)) {
        TextEditor(text: $wtfStory)
      }
    }
  }
}

struct FormView_Previews: PreviewProvider {
  static var previews: some View {
    FormView()
  }
}
