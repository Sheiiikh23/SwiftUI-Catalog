//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Une `View` qui arrange ses subviews de manière horizontale
///
/// 1 init pour un `HStack` :
///   - init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) where Content : View
///
/// Paramètres :
///   - alignment: `VerticalAlignment` = .center ––> l'alignement vertical de chaque subview
///       - top
///       - center
///       - bottom
///       - firstTextBaseline
///       - lastTextBaseline
///   - spacing: `CGFloat?` = nil ––> la distance horizontal entre chaque subview, `nil` pour une valeur par défaut
///   - @ViewBuilder content: () -> Content ––> un ensemble de `View` (maximum 10 subviews)
///
/// Remarque :
///   - Par défaut un `HStack` prend le moins de width & height possible

fileprivate enum TabItem {
  case demo
  case samples
}

struct HStackDemoView: View {
  
  var body: some View {
    TabView {
      HStackDemo()
        .tag(TabItem.demo)
        .tabItem { Label("Demo", systemImage: "shippingbox") }
      
      HStackSamples()
        .tag(TabItem.samples)
        .tabItem { Label("Samples", systemImage: "magazine") }
    }
  }
}

struct HStackDemo: View {

  @StateObject private var viewModel = HStackDemoViewModel()

  var body: some View {
    NavigationView {
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
        HStack(alignment: viewModel.alignment, spacing: viewModel.spacing) {
          ZStack {
            Circle()
              .foregroundColor(.yellow)
              .frame(width: 100, height: 100)
            Text("Left")
              .font(.title)
          }
          Text("Middle")
          Text("Right")
            .font(.callout)
        }
        .padding()
        .background(Color.mint)
      }
      .padding(.horizontal)
      .navigationTitle("HStack demo")
    }
  }
}

fileprivate enum Sample: String, Identifiable, CaseIterable {
  case top = "HStack with a top alignment"
  case center = "HStack with a center alignment"
  case bottom = "HStack with a bottom alignment"
  case firstTextBaseLine = "HStack with a firstTextBaseLine alignment"
  case lastTextBaseLine = "HStack with a lastTextBaseLine alignment"
  
  var id: UUID { UUID() }
  
  @ViewBuilder var destination: some View {
    switch self {
    case .top:
      NavigationLink(rawValue, destination: HSTackAlignmentTopSample())
    case .center:
      NavigationLink(rawValue, destination: HSTackAlignmentCenterSample())
    case .bottom:
      NavigationLink(rawValue, destination: HSTackAlignmentBottomSample())
    case .firstTextBaseLine:
      NavigationLink(rawValue, destination: HSTackAlignmentFirstTextBaseLineSample())
    case .lastTextBaseLine:
      NavigationLink(rawValue, destination: HSTackAlignmentLastTextBaseLineSample())
    }
  }
}

struct HStackSamples: View {
  
  var body: some View {
    NavigationView {
      List {
        ForEach(Sample.allCases, content: \.destination)
      }
      .navigationTitle("HStack samples")
    }
  }
}

struct HSTackAlignmentTopSample: View {
  
  var body: some View {
    HStack(alignment: .top, spacing: 8) {
      Circle()
        .foregroundColor(.yellow)
        .frame(width: 100, height: 100)
      Text("HStack with a top alignment")
      Color.purple
        .frame(width: 30, height: 200)
        .cornerRadius(16)
    }
    .padding(.horizontal)
    .background(.red, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("HStack with a top alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct HSTackAlignmentCenterSample: View {
  
  var body: some View {
    HStack(spacing: 8) {
      Circle()
        .foregroundColor(.yellow)
        .frame(width: 100, height: 100)
      Text("HStack with a center alignment")
      Color.purple
        .frame(width: 30, height: 200)
        .cornerRadius(16)
    }
    .padding(.horizontal)
    .background(.red, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("HStack with a center alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct HSTackAlignmentBottomSample: View {
  
  var body: some View {
    HStack(alignment: .bottom, spacing: 8) {
      Circle()
        .foregroundColor(.yellow)
        .frame(width: 100, height: 100)
      Text("HStack with a bottom alignment")
      Color.purple
        .frame(width: 30, height: 200)
        .cornerRadius(16)
    }
    .padding(.horizontal)
    .background(.red, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("HStack with a bottom alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct HSTackAlignmentFirstTextBaseLineSample: View {
  
  var body: some View {
    HStack(alignment: .firstTextBaseline, spacing: 8) {
      ZStack {
        Circle()
          .foregroundColor(.yellow)
          .frame(width: 100, height: 100)
        Text("Left")
      }
      Text("HStack with a firstTextBaseLine alignment")
      ZStack(alignment: .top) {
        Color.purple
          .frame(width: 40, height: 200)
          .cornerRadius(16)
        Text("Right")
      }
    }
    .padding(.horizontal)
    .background(.red, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("HStack with a firstTextBaseLine alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct HSTackAlignmentLastTextBaseLineSample: View {
  
  var body: some View {
    HStack(alignment: .lastTextBaseline, spacing: 8) {
      ZStack {
        Circle()
          .foregroundColor(.yellow)
          .frame(width: 100, height: 100)
        Text("Left")
      }
      Text("HStack with a lastTextBaseLine alignment")
      ZStack(alignment: .bottom) {
        Color.purple
          .frame(width: 40, height: 200)
          .cornerRadius(16)
        Text("Right")
      }
    }
    .padding(.horizontal)
    .background(.red, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("HStack with a lastTextBaseLine alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct HStackView_Previews: PreviewProvider {
  static var previews: some View {
    HStackDemoView()
    HStackDemo()
    HStackSamples()
    HSTackAlignmentTopSample()
    HSTackAlignmentCenterSample()
    HSTackAlignmentBottomSample()
    HSTackAlignmentFirstTextBaseLineSample()
    HSTackAlignmentLastTextBaseLineSample()
  }
}
