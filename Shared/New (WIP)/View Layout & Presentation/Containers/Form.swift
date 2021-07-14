//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Une `View` "container" pour regrouper des contrôles pour la saisie de données
///
/// 1 init pour un `Form` :
///   - init(@ViewBuilder content: () -> Content) where Content : View
///
/// Paramètres :
/// - @ViewBuilder content: () -> Content ––> un ensemble de `View` (maximum 10 subviews)
///
/// Remarques :
///  - Généralement précédé d'une `NavigationView` notamment pour les `Picker`
///  - Un `Form` contient généralement des `Section
///  - Le `Form` a un rendu propre à chaque plateforme

struct FormView: View {

  @State private var firstName = ""
  @State private var lastName = ""
  @State private var birthday = Date()
  @State private var favoriteColor = Color.white
  @State private var isBlind = false
  @State private var wtfStory = ""
  @State private var favoriteHAlignment: HorizontalAlignmentCustom = .center

  var body: some View {
    NavigationView {
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
        Section {
          Picker("Ton alignment horizontal préféré", selection: $favoriteHAlignment) {
            ForEach(HorizontalAlignmentCustom.allCases, id: \.self) { alignment in
              Text(alignment.description.firstLetterCapitalized)
                .tag(alignment)
            }
          }
        }
      }
      .navigationTitle("Settings")
    }
  }
}

struct FormView_Previews: PreviewProvider {
  static var previews: some View {
    FormView()
  }
}
