//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Une `View` qui arrange ses sous-vues de manière verticale, créant chaque subview à la volée et si nécessaire (d'où le lazy)
///
/// 1 init pour un `LazyVStack` :
///   - init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content) where Content : View
///
/// Paramètres :
///   - alignment: `HorizontalAlignment` = .center ––> l'alignement horizontal de chaque subview
///       - leading
///       - center
///       - trailing
///   - spacing: `CGFloat?` = nil ––> la distance vertical entre chaque subview, `nil` pour une valeur par défaut
///   - pinnedViews: `PinnedScrollableViews` = .init() ––> les types de subviews qui vont être épinglés
///       - sectionHeaders : rend le header d'une `Section` sticky
///       - sectionFooters : rend le footer d'une `Section` sticky
///   - @ViewBuilder content: () -> Content ––> un ensemble de `View` (maximum 10 subviews)
///
/// Remarque :
///   - Par défaut un `LazyVStack` prend toute la width du parent-container

fileprivate enum TabItem {
  case demo
  case samples
}

struct LazyVStackDemoView: View {
  
  var body: some View {
    TabView {
      LazyVStackDemo()
        .tag(TabItem.demo)
        .tabItem { Label("Demo", systemImage: "shippingbox") }
      
      LazyVStackSamples()
        .tag(TabItem.samples)
        .tabItem { Label("Samples", systemImage: "magazine") }
    }
  }
}

struct LazyVStackDemo: View {

  @StateObject private var viewModel = LazyVStackDemoViewModel()

  var body: some View {
    NavigationView {
      ScrollView {
        VStack(spacing: 20) {
          VStack(spacing: 8) {
            HStack(alignment: .firstTextBaseline, spacing: 10) {
              Text("Horizontal Alignment :")
              Picker("Horizontal Alignment", selection: $viewModel.customAlignment) {
                ForEach(HorizontalAlignmentCustom.allCases) { alignment in
                  Text(alignment.description.firstLetterCapitalized)
                    .tag(alignment)
                }
              }
              .pickerStyle(.menu)
            }
            VStack {
              Text("Spacing value : \(Int(viewModel.spacing))")
                .fontWeight(.bold)
              Slider(value: $viewModel.spacing, in: 0...50)
            }
            Toggle("show pinnedViews ? \(viewModel.showPinnedViews.description)", isOn: $viewModel.showPinnedViews)
              .toggleStyle(SwitchToggleStyle(tint: .mint))
          }
          .padding(.horizontal)
          LazyVStack(alignment: viewModel.alignment, spacing: viewModel.spacing, pinnedViews: viewModel.showPinnedViews ? [.sectionHeaders, .sectionFooters] : .init()) {
            ZStack {
              Rectangle()
                .fill(.mint)
                .frame(width: 200, height: 200)
                .padding(.leading)
              Text("\(viewModel.alignment.description) alignment")
                .multilineTextAlignment(.center)
            }
            Section(header: HeaderAndFooterPinnedView(title: "1 to 250"),
                    footer: HeaderAndFooterPinnedView(title: "1 to 250")) {
              ForEach(1...250, id: \.self) { item in
                ZStack {
                  Rectangle()
                    .fill(randomColor())
                  Text("Item\n n°\(item)")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                }
                .onAppear { print("Cell n°\(item)") }
              }
            }
            Section(header: HeaderAndFooterPinnedView(title: "251 to 500"),
                    footer: HeaderAndFooterPinnedView(title: "251 to 500")) {
              ForEach(251...500, id: \.self) { item in
                ZStack {
                  Rectangle()
                    .fill(randomColor())
                  Text("Item\n n°\(item)")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                }
                .onAppear { print("Cell n°\(item)") }
              }
            }
            Section(header: HeaderAndFooterPinnedView(title: "501 to 750"),
                    footer: HeaderAndFooterPinnedView(title: "501 to 750")) {
              ForEach(501...751, id: \.self) { item in
                ZStack {
                  Rectangle()
                    .fill(randomColor())
                  Text("Item\n n°\(item)")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                }
                .onAppear { print("Cell n°\(item)") }
              }
            }
            Section(header: HeaderAndFooterPinnedView(title: "751 to 1000"),
                    footer: HeaderAndFooterPinnedView(title: "751 to 1000")) {
              ForEach(751...1000, id: \.self) { item in
                ZStack {
                  Rectangle()
                    .fill(randomColor())
                  Text("Item\n n°\(item)")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                }
                .onAppear { print("Cell n°\(item)") }
              }
            }
          }
          .background(Color.gray.opacity(0.75))
        }
      }
      .navigationTitle("LazyVStack demo")
    }
  }
}

fileprivate enum Sample: String, Identifiable, CaseIterable {
  case leading = "LazyVStack with a leading alignment"
  case center = "LazyVStack with a center alignment"
  case trailing = "LazyVStack with a trailing alignment"
  
  var id: UUID { UUID() }
  
  @ViewBuilder var destination: some View {
    switch self {
    case .leading:
      NavigationLink(rawValue, destination: LazyVStackAlignmentLeadingSample())
    case .center:
      NavigationLink(rawValue, destination: LazyVStackAlignmentCenterSample())
    case .trailing:
      NavigationLink(rawValue, destination: LazyVStackAlignmentTrailingSample())
    }
  }
}

struct LazyVStackSamples: View {
  
  var body: some View {
    NavigationView {
      List {
        ForEach(Sample.allCases, content: \.destination)
      }
      .navigationTitle("LazyVStack samples")
    }
  }
}

struct LazyVStackAlignmentLeadingSample: View {
  
  var body: some View {
    LazyVStack(alignment: .leading, spacing: 8) {
      Rectangle()
        .foregroundColor(.blue)
        .frame(width: 75, height: 30)
      Text("LazyVStack with a leading alignment")
      Rectangle()
        .foregroundColor(.red)
        .frame(width: 150, height: 30)
    }
    .padding(.vertical)
    .background(.mint, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("LazyVStack with a leading alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct LazyVStackAlignmentCenterSample: View {
  
  var body: some View {
    LazyVStack(spacing: 8) {
      Rectangle()
        .foregroundColor(.blue)
        .frame(width: 75, height: 30)
      Text("LazyVStack with a center alignment")
      Rectangle()
        .foregroundColor(.red)
        .frame(width: 150, height: 30)
    }
    .padding(.vertical)
    .background(.mint, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("LazyVStack with a center alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct LazyVStackAlignmentTrailingSample: View {
  
  var body: some View {
    LazyVStack(alignment: .trailing, spacing: 8) {
      Rectangle()
        .foregroundColor(.blue)
        .frame(width: 75, height: 30)
      Text("LazyVStack with a trailing alignment")
      Rectangle()
        .foregroundColor(.red)
        .frame(width: 150, height: 30)
    }
    .padding(.vertical)
    .background(.mint, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("LazyVStack with a trailing alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct LazyVStackView_Previews: PreviewProvider {
  static var previews: some View {
    LazyVStackDemoView()
    LazyVStackDemo()
    LazyVStackSamples()
    LazyVStackAlignmentLeadingSample()
    LazyVStackAlignmentCenterSample()
    LazyVStackAlignmentTrailingSample()
  }
}
