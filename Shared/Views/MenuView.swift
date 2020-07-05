//
//  MenuView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 07/08/2020.
//

import SwiftUI


// MARK: - Utilisation :
#warning("Refacto")
#warning("add description")
struct MenuView: View {

  @State private var index = 0

  var body: some View {
    NavigationView {
      TabView(selection: $index) {
        Color.red
          .tag(0)
          .tabItem { Image(systemName: "house.fill") }

        Color.blue
          .tag(1)
          .tabItem { Image(systemName: "suit.heart.fill") }

        Color.green
          .tag(2)
          .tabItem { Image(systemName: "gear") }

        Color.pink
          .tag(3)
          .tabItem { Image(systemName: "person.fill") }
      }
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
      .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
      .edgesIgnoringSafeArea(.all)
      .navigationTitle("Home")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Menu {
            Button { index = 0 } label: { Label("Home", systemImage: "house.fill") }
            Button { index = 1 } label: { Label("Like", systemImage: "suit.heart.fill") }
            Button { index = 2 } label: { Label("Options", systemImage: "gear") }
            Button { index = 3 } label: { Label("Account", systemImage: "person.fill") }
          } label: {
            Text("Menu principal")
          }
        }
      }
    }
  }
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    MenuView()
  }
}

