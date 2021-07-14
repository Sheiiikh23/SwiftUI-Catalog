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

struct IfPostFixMemberExpressions: View {

  var body: some View {
    Text("Italic sur iOS, bold sinon")
    #if os(iOS)
      .italic()
    #else
      .bold()
    #endif
  }
}

struct AsyncAwaitInSwiftUI: View {

  @State private var news = [
    NewsItem(id: 0, title: "Want the latest news ?", strap: "Pull to refresh !")
  ]

  var body: some View {
    NavigationView {
      List(news) { item in
        VStack(alignment: .leading) {
          Text(item.title)
            .font(.headline)
          Text(item.strap)
            .foregroundColor(.secondary)
        }
      }
    }
    .refreshable {
      do {
        let url = URL(string: "https://www.hackingwithswift.com/samples/news-1.json")!
        let (data, response) = try await URLSession.shared.data(from: url)
        print(data, response)
        news = try JSONDecoder().decode([NewsItem].self, from: data)
      } catch {
        print("WOOPS", error.localizedDescription)
      }
    }
  }
}

struct PostFixMemberExpressionsView: View {

  var body: some View {
    Text("Hello world")
    #if os(macOS)
      .font(.largeTitle)
    #else
      #if DEBUG
      .font(.headline)
      #else
      .background(Color.red)
      #endif
    #endif
  }
}

struct ConvertDoubleToCGFloatAndViceVersaView: View {

  let value: Double = 0.9 // Peut être Double comme CGFloat

  var body: some View {
    Text("Hello world!")
      .opacity(value) // Double
      .scaleEffect(value) // CGFloat, en vrai fait : .scaleEffect(CGFloat(value))
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
//      ListStyleModifierWithStaticProperty()
//      TabViewStyleModifierWithStaticProperty()
//      IfPostFixMemberExpressions()
//      AsyncAwaitInSwiftUI()
//      PostFixMemberExpressionsView()
      ConvertDoubleToCGFloatAndViceVersaView()
    }
  }
}
