//
//  ToolBarModifier.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

#warning("Refacto")

struct ToolBarModifier: View {
  var body: some View {
    NavigationView {
      List {
        ForEach(1...100, id: \.self) { item in
          Text("Hello Toolbar")
        }
        HStack {
          Spacer()
          Text("There is  10 \"Hello ToolBar\" ")
          Spacer()
        }
      }
      .navigationBarTitle("Test toolBar")
      // Sur watchOS la toolBar permet de pin un bouton tout en haut de l'écran
      //      --> Placement .primaryAction
      // MARK: Normalement censé remplir la navigationBarItems
      //  --> À noter qu'on peut toujours utiliser navigationBarItem(leading, trailing)
      .toolbar {
        // D'autres placement disponible à tester
        // Typqiement pour le navigationBarLeading  = primaryAction
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Action", action: { })
        }
        // D'autres placement disponible à tester
        ToolbarItem(placement: .navigationBarTrailing) {
          EditButton()
        }
        // MARK: Pour le placement bottom on a sur iOS la barre grisée d'origine
        ToolbarItem(placement: .bottomBar) {
          HStack {
            Spacer()
            Button(action: {}, label: {
              Image(systemName: "square.and.arrow.up")
                .font(.title2)
            })
          }
        }
      }
    }
  }
}

struct ToolBarModifier_Previews: PreviewProvider {
  static var previews: some View {
    ToolBarModifier()
  }
}
