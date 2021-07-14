//
//  SectionView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 22/02/2021.
//

import SwiftUI

/// Section : rajoute une hiérarchie logique à nos Views, permet de les "séparer" et d'afficher un contenu personnalisé pour chaque section.
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Peut être composé d'un Header et d'un Footer
/// Très généralement utilisé au sein de List ou Form

// MARK: - Utilisation : Séparer la hiérarchie des Views en affichant un contenu custom pour chaque section pouvant comprendre un header et footer

struct SectionViewInList: View {

  var body: some View {
    List {
      Section(header: Text("Hello World").foregroundColor(.red)) {
        ForEach(0...5, id: \.self) { _ in
          Text("Hello World")
        }
      }
      Section(header: Text("Goodbye World").foregroundColor(.red),
              footer: Text("Goodbye World").foregroundColor(.red)) {
        ForEach(0...5, id: \.self) { _ in
          Text("Goodbye World")
        }
      }
    }
  }
}

struct SectionViewInForm: View {

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

struct SectionView_Previews: PreviewProvider {
  static var previews: some View {
    SectionViewInList()
    SectionViewInForm()
  }
}
