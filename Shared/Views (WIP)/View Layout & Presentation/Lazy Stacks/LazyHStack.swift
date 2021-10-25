//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, watchOS 7.0, tvOS 14.0, macOS 11.0, Mac Catalyst 14.0
/// Description : Une `View` qui arrange ses subviews de manière horizontale, créant chaque subview à la volée et si nécessaire (d'où le lazy)
///
/// 1 init pour un `LazyHStack` :
///   - init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content) where Content : View
///   
/// Paramètres :
///   - alignment: `VerticalAlignment` = .center ––> l'alignement vertical de chaque subview
///       - top
///       - center
///       - bottom
///       - firstTextBaseline
///       - lastTextBaseline
///   - spacing: `CGFloat?` = nil ––> la distance horizontal entre chaque subview, `nil` pour une valeur par défaut
///   - pinnedViews: `PinnedScrollableViews` = .init() ––> les types de subviews qui vont être épinglés
///       - sectionHeaders : rend le header d'une `Section` sticky
///       - sectionFooters : rend le footer d'une `Section` sticky
///   - @ViewBuilder content: () -> Content ––> un ensemble de `View` (maximum 10 subviews)
///
/// Remarque :
///   - Par défaut un `LazyHStack` prend toute la height du parent-container

fileprivate enum TabItem {
  case demo
  case samples
}

struct LazyHStackDemoView: View {
  
  var body: some View {
    TabView {
      LazyHStackDemo()
        .tag(TabItem.demo)
        .tabItem { Label("Demo", systemImage: "shippingbox") }
      
      LazyHStackSamples()
        .tag(TabItem.samples)
        .tabItem { Label("Samples", systemImage: "magazine") }
    }
  }
}

struct LazyHStackDemo: View {

  @StateObject private var viewModel = LazyHStackDemoViewModel()

  var body: some View {
    NavigationView {
      VStack(spacing: 20) {
        VStack(spacing: 8) {
          HStack(alignment: .firstTextBaseline, spacing: 10) {
            Text("Vertical Alignment :")
            Picker("Vertical Alignment", selection: $viewModel.customAlignment) {
              ForEach(VerticalAlignmentCustom.allCases) { alignment in
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
          Toggle("Show pinnedViews ? \(viewModel.showPinnedViews.description)", isOn: $viewModel.showPinnedViews)
            .toggleStyle(SwitchToggleStyle(tint: .mint))
        }
        .padding(.horizontal)
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHStack(alignment: viewModel.alignment, spacing: viewModel.spacing, pinnedViews: viewModel.showPinnedViews ? [.sectionHeaders, .sectionFooters] : .init()) {
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
      .navigationTitle("LazyHStack demo")
    }
  }
}

fileprivate enum Sample: String, Identifiable, CaseIterable {
  case top = "LazyHStack with a top alignment"
  case center = "LazyHStack with a center alignment"
  case bottom = "LazyHStack with a bottom alignment"
  case firstTextBaseLine = "LazyHStack with a firstTextBaseLine alignment"
  case lastTextBaseLine = "LazyHStack with a lastTextBaseLine alignment"
  
  var id: String { rawValue }
  
  @ViewBuilder var destination: some View {
    switch self {
    case .top:
      NavigationLink(rawValue, destination: LazyHSTackAlignmentTopSample())
    case .center:
      NavigationLink(rawValue, destination: LazyHSTackAlignmentCenterSample())
    case .bottom:
      NavigationLink(rawValue, destination: LazyHSTackAlignmentBottomSample())
    case .firstTextBaseLine:
      NavigationLink(rawValue, destination: LazyHSTackAlignmentFirstTextBaseLineSample())
    case .lastTextBaseLine:
      NavigationLink(rawValue, destination: LazyHSTackAlignmentLastTextBaseLineSample())
    }
  }
}

struct LazyHStackSamples: View {
  
  var body: some View {
    NavigationView {
      List {
        ForEach(Sample.allCases, content: \.destination)
      }
      .navigationTitle("LazyHStack samples")
    }
  }
}

struct LazyHSTackAlignmentTopSample: View {
  
  var body: some View {
    LazyHStack(alignment: .top, spacing: 8) {
      Circle()
        .foregroundColor(.yellow)
        .frame(width: 100, height: 100)
      Text("LazyHStack with a\ntop alignment")
      Color.purple
        .frame(width: 30)
        .cornerRadius(16)
    }
    .padding(.horizontal)
    .background(.red, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("LazyHStack with a top alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct LazyHSTackAlignmentCenterSample: View {
  
  var body: some View {
    LazyHStack(spacing: 8) {
      Circle()
        .foregroundColor(.yellow)
        .frame(width: 100, height: 100)
      Text("LazyHStack with a\ncenter alignment")
      Color.purple
        .frame(width: 30)
        .cornerRadius(16)
    }
    .padding(.horizontal)
    .background(.red, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("LazyHStack with a center alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct LazyHSTackAlignmentBottomSample: View {
  
  var body: some View {
    LazyHStack(alignment: .bottom, spacing: 8) {
      Circle()
        .foregroundColor(.yellow)
        .frame(width: 100, height: 100)
      Text("LazyHStack with a\nbottom alignment")
      Color.purple
        .frame(width: 30)
        .cornerRadius(16)
    }
    .padding(.horizontal)
    .background(.red, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("LazyHStack with a bottom alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct LazyHSTackAlignmentFirstTextBaseLineSample: View {
  
  var body: some View {
    LazyHStack(alignment: .firstTextBaseline, spacing: 8) {
      ZStack {
        Circle()
          .foregroundColor(.yellow)
          .frame(width: 100, height: 100)
        Text("Left")
      }
      Text("LazyHStack with a\nfirstTextBaseLine alignment")
      ZStack(alignment: .top) {
        Color.purple
          .frame(width: 40)
          .cornerRadius(16)
        Text("Right")
      }
    }
    .padding(.horizontal)
    .background(.red, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("LazyHStack with a firstTextBaseLine alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct LazyHSTackAlignmentLastTextBaseLineSample: View {
  
  var body: some View {
    LazyHStack(alignment: .lastTextBaseline, spacing: 8) {
      ZStack {
        Circle()
          .foregroundColor(.yellow)
          .frame(width: 100, height: 100)
        Text("Left")
      }
      Text("LazyHStack with a\nlastTextBaseLine alignment")
      ZStack(alignment: .bottom) {
        Color.purple
          .frame(width: 40)
          .cornerRadius(16)
        Text("Right")
      }
    }
    .padding(.horizontal)
    .background(.red, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("LazyHStack with a lastTextBaseLine alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct LazyHStackView_Previews: PreviewProvider {
  static var previews: some View {
    LazyHStackDemoView()
    LazyHStackDemo()
    LazyHStackSamples()
    LazyHSTackAlignmentTopSample()
    LazyHSTackAlignmentCenterSample()
    LazyHSTackAlignmentBottomSample()
    LazyHSTackAlignmentFirstTextBaseLineSample()
    LazyHSTackAlignmentLastTextBaseLineSample()
  }
}
