//
//  ToolBarModifier.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 27/06/2020.
//

import SwiftUI

#warning("Normalement dispo pour watchOS. Regarder les updates de la doc")

struct ToolBarModifier: View {
    var body: some View {
      NavigationView {
        List(0...20, id: \.self) { item in
          Text("Hello row n°\(item)")
            .font(.title3)
        }
        .navigationBarTitle("ToolBar")
        .toolbar {
          ToolbarItem(placement: .primaryAction) {
            Text("ToolBarItem")
          }
        }
      }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
      ToolBarModifier()
    }
}
