//
//  SwiftUIView.swift
//  iOS
//
//  Created by Lucas Abijmil on 08/06/2021.
//

import SwiftUI

/// Avec Swift 5.5 (cf Extending static member lookup in generic contexts), pour les modifiers de Style, on utiliser la static property

struct ListStyleModifierWithStaticProperty: View {
  var body: some View {
    List(1..<51) {
      Text("\($0)")
    }
//    .listStyle(SidebarListStyle()) // AVANT
    .listStyle(.sidebar) // APRÈS
  }
}

struct TabViewStyleModifierWithStaticProperty: View {

  var body: some View {
    TabView {
      Text("Yo")
        .tabItem { Image(systemName: "gear") }
        .tag(0)
      Text("yo")
        .tabItem { Image(systemName: "gear") }
        .tag(1)
    }
    .background(Color.red)
    .ignoresSafeArea()
//    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // AVANT
    .tabViewStyle(.page(indexDisplayMode: .always)) // APRÈS
  }
}

struct TextFieldStyleModifierWithStaticProperty: View {

  @State private var name = "Lucas"

  var body: some View {
    VStack(alignment: .leading) {
      TextField("Enter your name", text: $name)
//        .textFieldStyle(RoundedBorderTextFieldStyle()) // AVANT
        .textFieldStyle(.roundedBorder) // APRÈS 
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ListStyleModifierWithStaticProperty()
      TabViewStyleModifierWithStaticProperty()
    }
  }
}
