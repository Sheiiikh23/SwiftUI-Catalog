//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Une `View` scrollable
///
/// 1 init pour une `ScrollView` :
///   - init(_ axes: Axis.Set = .vertical, showsIndicators: Bool = true, @ViewBuilder content: () -> Content) where Content : View
///
/// Paramètres
///   - axes: Axis.Set = .vertical ––> le ou les axe(s) de défilement de la scroll view
///   - showsIndicators: Bool = true ––> un booléan qui indique si on affiche ou non le composant de défilement
///   - @ViewBuilder content: () -> Content ––> un ensemble de `View` (maximum 10 subviews)
///
/// Remarque :
///   - Par défaut une `ScrollView` prend le moins de height & width possible
/// Tip :
///   - Pour faire une `ScrollView` verticale & horizontale il suffit de passer [.vertical, .horizontal] dans l'init (cf `VerticalAndHorizontalScrollViewSample`)

fileprivate enum TabItem {
  case demo
  case samples
}

struct ScrollViewDemoView: View {
  
  var body: some View {
    TabView {
      ScrollViewDemo()
        .tag(TabItem.demo)
        .tabItem { Label("Demo", systemImage: "shippingbox") }
      
      ScrollViewSamples()
        .tag(TabItem.samples)
        .tabItem { Label("Samples", systemImage: "magazine") }
    }
  }
}

struct ScrollViewDemo: View {

  @StateObject private var viewModel = ScrollViewDemoViewModel()

  var body: some View {
    Group {
      switch viewModel.customAxes {
      case .vertical:
        VerticalScrollViewDemo()
      case .horizontal:
        HorizontalScrollViewDemo()
      case .verticalAndHorizontal:
        VerticalAndHorizontalScrollViewSample()
      }
    }
    .safeAreaInset(edge: .bottom) {
      VStack(spacing: 10) {
        Picker("ScrollView axes", selection: $viewModel.customAxes) {
          ForEach(CustomAxis.allCases) { axe in
            Text(axe.rawValue.firstLetterCapitalized)
              .tag(axe)
          }
        }
        .pickerStyle(.segmented)
        Toggle("ShowsIndicators : \(viewModel.showsIndicators.description)", isOn: $viewModel.showsIndicators)
          .toggleStyle(SwitchToggleStyle(tint: .purple))
      }
      .padding()
      .background(.regularMaterial)
    }
    .environmentObject(viewModel)
  }
}

struct ScrollViewSamples: View {
  var body: some View {
    NavigationView {
      List {
        NavigationLink("Vertical ScrollView", destination: VerticalScrollViewSample())
        NavigationLink("Horizontal ScrollView", destination: HorizontalScrollViewSample())
        NavigationLink("Vertical & Horizontal ScrollView", destination: VerticalAndHorizontalScrollViewSample())
      }
      .navigationTitle("ScrollView Samples")
    }
  }
}

struct VerticalScrollViewSample: View {

  var body: some View {
    ScrollView {
      VStack(spacing: 10) {
        ForEach(0..<100, id: \.self) { row in
          Text("Row n°\(row)")
        }
      }
    }
    .background(.purple)
    .navigationTitle("Vertical ScrollView")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct HorizontalScrollViewSample: View {

  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        ForEach(0..<100, id: \.self) { row in
          Text("Row n°\(row)")
        }
      }
    }
    .background(.purple)
    .navigationTitle("Horizontal ScrollView")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct VerticalAndHorizontalScrollViewSample: View {

  var body: some View {
    ScrollView([.vertical, .horizontal]) {
      ZStack {
        LinearGradient(colors: [.blue, .indigo, .purple], startPoint: .leading, endPoint: .trailing)
          .ignoresSafeArea()
        LazyVStack(alignment: .leading, spacing: 10) {
          ForEach(0...100, id: \.self) { row in
            LazyHStack(spacing: 10) {
              ForEach(0...250, id: \.self) { row in
                Text("Horizontal Row n°\(row)")
              }
            }
          }
        }
      }
    }
    .navigationTitle("Vertical & Horizontal ScrollView")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ScrollViewDemo_Previews: PreviewProvider {
  static var previews: some View {
    ScrollViewDemoView()
    ScrollViewSamples()
    VerticalScrollViewSample()
    HorizontalScrollViewSample()
    VerticalAndHorizontalScrollViewSample()
  }
}
