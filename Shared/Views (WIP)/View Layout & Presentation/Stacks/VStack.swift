//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Une `View` qui arrange ses sous-vues de manière verticale
///
/// 1 init pour un `VStack` :
///   - init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) where Content : View
///
/// Paramètres :
///   - alignment: `HorizontalAlignment` = .center ––> l'alignement horizontal de chaque subview
///       - leading
///       - center
///       - trailing
///   - spacing: `CGFloat?` = nil ––> la distance vertical entre chaque subview, `nil` pour une valeur par défaut
///   - @ViewBuilder content: () -> Content ––> un ensemble de `View` (maximum 10 subviews)
///
/// Remarque :
///   - Par défaut un `VStack` prend le moins de width & height possible

fileprivate enum TabItem {
  case demo
  case samples
}

struct VStackDemoView: View {
  
  var body: some View {
    TabView {
      VStackDemo()
        .tag(TabItem.demo)
        .tabItem { Label("Demo", systemImage: "shippingbox") }
      
      VStackSamples()
        .tag(TabItem.samples)
        .tabItem { Label("Samples", systemImage: "magazine") }
    }
  }
}

struct VStackDemo: View {

  @StateObject private var viewModel = VStackDemoViewModel()

  var body: some View {
    NavigationView {
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
        VStack(alignment: viewModel.alignment, spacing: viewModel.spacing) {
          Text("Peu de texte")
          Text("Beacoup plus de texte")
          Text("Beaucoup beaucoup plus de texte")
        }
        .padding()
        .background(Color.mint)
      }
      .padding(.horizontal)
      .navigationTitle("VStack demo")
    }
  }
}

fileprivate enum Sample: String, Identifiable, CaseIterable {
  case leading = "VStack with a leading alignment"
  case center = "VStack with a center alignment"
  case trailing = "VStack with a trailing alignment"
  
  var id: UUID { UUID() }
  
  @ViewBuilder var destination: some View {
    switch self {
    case .leading:
      NavigationLink(rawValue, destination: VStackAlignmentLeadingSample())
    case .center:
      NavigationLink(rawValue, destination: VStackAlignmentCenterSample())
    case .trailing:
      NavigationLink(rawValue, destination: VStackAlignmentTrailingSample())
    }
  }
}

struct VStackSamples: View {
  
  var body: some View {
    NavigationView {
      List {
        ForEach(Sample.allCases, content: \.destination)
      }
      .navigationTitle("VStack samples")
    }
  }
}

struct VStackAlignmentLeadingSample: View {
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Rectangle()
        .foregroundColor(.blue)
        .frame(width: 75, height: 30)
      Text("VStack with a leading alignment")
      Rectangle()
        .foregroundColor(.red)
        .frame(width: 150, height: 30)
    }
    .padding(.vertical)
    .background(.mint, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("VStack with a leading alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct VStackAlignmentCenterSample: View {
  
  var body: some View {
    VStack(spacing: 8) {
      Rectangle()
        .foregroundColor(.blue)
        .frame(width: 75, height: 30)
      Text("VStack with a center alignment")
      Rectangle()
        .foregroundColor(.red)
        .frame(width: 150, height: 30)
    }
    .padding(.vertical)
    .background(.mint, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("VStack with a center alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct VStackAlignmentTrailingSample: View {
  
  var body: some View {
    VStack(alignment: .trailing, spacing: 8) {
      Rectangle()
        .foregroundColor(.blue)
        .frame(width: 75, height: 30)
      Text("VStack with a trailing alignment")
      Rectangle()
        .foregroundColor(.red)
        .frame(width: 150, height: 30)
    }
    .padding(.vertical)
    .background(.mint, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    .navigationTitle("VStack with a trailing alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct VStackView_Previews: PreviewProvider {
  static var previews: some View {
    VStackDemoView()
    VStackDemo()
    VStackSamples()
    VStackAlignmentLeadingSample()
    VStackAlignmentCenterSample()
    VStackAlignmentTrailingSample()
  }
}
