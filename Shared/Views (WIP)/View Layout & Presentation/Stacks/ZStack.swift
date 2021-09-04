//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Une `View` qui arrange ses sous-vues dans un plan en 3D
///
/// 1 init pour un `ZStack` :
///   - init(alignment: Alignment = .center, @ViewBuilder content: () -> Content) where Content : View
///
/// Paramètres :
///   - alignment: `Alignment` = .center : l'alignement de chaque subview
///       - top
///       - leading
///       - bottom
///       - trailing
///       - center
///       - topLeading
///       - topTrailing
///       - bottomLeading
///       - bottomTrailing
///   - @ViewBuilder content: () -> Content ––> un ensemble de `View` (maximum 10 subviews)
///
/// Remarque :
///   - Par défaut un `ZStack` prend le moins de height & width possible
///
/// Tip :
///   - Utiliser un `ZStack` pour afficher un background bord à bord (voir `ZStackBackgroundSample`)

fileprivate enum TabItem {
  case demo
  case samples
}

struct ZStackDemoView: View {
  
  var body: some View {
    TabView {
      ZStackDemo()
        .tag(TabItem.demo)
        .tabItem { Label("Demo", systemImage: "shippingbox") }
      
      ZStackSamples()
        .tag(TabItem.samples)
        .tabItem { Label("Samples", systemImage: "magazine") }
    }
  }
}

struct ZStackDemo: View {

  @StateObject private var viewModel = ZStackDemoViewModel()

  var body: some View {
    NavigationView {
      VStack(spacing: 8) {
        HStack(alignment: .firstTextBaseline, spacing: 10) {
          Text("Alignment :")
          Picker("Alignment", selection: $viewModel.customAlignment) {
            ForEach(AlignmentCustom.allCases) { alignment in
              Text(alignment.description.firstLetterCapitalized)
                .tag(alignment)
            }
          }
          .pickerStyle(.menu)
        }
        ZStack(alignment: viewModel.alignment) {
          Rectangle()
            .foregroundColor(.red)
            .frame(width: 300, height: 300)
          Rectangle()
            .foregroundColor(.orange)
            .frame(width: 150, height: 150)
          Rectangle()
            .foregroundColor(.yellow)
            .frame(width: 75, height: 75)
        }
        .animation(.linear(duration: 0.2), value: viewModel.alignment)
      }
      .frame(maxWidth: .infinity)
      .navigationTitle("ZStack demo")
    }
  }
}

fileprivate enum Sample: String, Identifiable, CaseIterable {
  case top = "ZStack with a top alignment"
  case leading = "ZStack with a leading alignment"
  case bottom = "ZStack with a bottom alignment"
  case trailing = "ZStack with a trailing alignment"
  case center = "ZStack with a center alignment"
  case topLeading = "ZStack with a topLeading alignment"
  case topTrailing = "ZStack with a topTrailing alignment"
  case bottomLeading = "ZStack with a bottomLeading alignment"
  case bottomTrailing = "ZStack with a bottomTrailing alignment"
  case background = "ZStack with a background edge to edge"
  
  
  var id: UUID { UUID() }
  
  @ViewBuilder var destination: some View {
    switch self {
    case .top:
      NavigationLink(rawValue, destination: ZStackAlignmentTopSample())
    case .leading:
      NavigationLink(rawValue, destination: ZStackAlignmentLeadingSample())
    case .bottom:
      NavigationLink(rawValue, destination: ZStackAlignmentBottomSample())
    case .trailing:
      NavigationLink(rawValue, destination: ZStackAlignmentTrailingSample())
    case .center:
      NavigationLink(rawValue, destination: ZStackAlignmentCenterSample())
    case .topLeading:
      NavigationLink(rawValue, destination: ZStackAlignmentTopLeadingSample())
    case .topTrailing:
      NavigationLink(rawValue, destination: ZStackAlignmentTopTrailingSample())
    case .bottomLeading:
      NavigationLink(rawValue, destination: ZStackAlignmentBottomLeadingSample())
    case .bottomTrailing:
      NavigationLink(rawValue, destination: ZStackAlignmentBottomTrailingSample())
    case .background:
      NavigationLink(rawValue, destination: ZStackBackgroundSample())
    }
  }
}

struct ZStackSamples: View {
  
  var body: some View {
    NavigationView {
      List {
        ForEach(Sample.allCases, content: \.destination)
      }
      .navigationTitle("ZStack samples")
    }
  }
}

struct ZStackAlignmentTopSample: View {
  
  var body: some View {
    ZStack(alignment: .top) {
      Rectangle()
        .fill(.mint)
        .frame(width: 350, height: 350)
      Rectangle()
        .fill(.red)
        .frame(width: 200, height: 200)
      Text("ZStack with a\ntop alignment")
    }
    .navigationTitle("ZStack with a top alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ZStackAlignmentLeadingSample: View {
  
  var body: some View {
    ZStack(alignment: .leading) {
      Rectangle()
        .fill(.mint)
        .frame(width: 350, height: 350)
      Rectangle()
        .fill(.red)
        .frame(width: 200, height: 200)
      Text("ZStack with a\nleading alignment")
    }
    .navigationTitle("ZStack with a leading alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ZStackAlignmentBottomSample: View {
  
  var body: some View {
    ZStack(alignment: .bottom) {
      Rectangle()
        .fill(.mint)
        .frame(width: 350, height: 350)
      Rectangle()
        .fill(.red)
        .frame(width: 200, height: 200)
      Text("ZStack with a\nbottom alignment")
    }
    .navigationTitle("ZStack with a bottom alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ZStackAlignmentTrailingSample: View {
  
  var body: some View {
    ZStack(alignment: .trailing) {
      Rectangle()
        .fill(.mint)
        .frame(width: 350, height: 350)
      Rectangle()
        .fill(.red)
        .frame(width: 200, height: 200)
      Text("ZStack with a\ntrailing alignment")
    }
    .navigationTitle("ZStack with a trailing alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ZStackAlignmentCenterSample: View {
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(.mint)
        .frame(width: 350, height: 350)
      Rectangle()
        .fill(.red)
        .frame(width: 200, height: 200)
      Text("ZStack with a\ncenter alignment")
    }
    .navigationTitle("ZStack with a center alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ZStackAlignmentTopLeadingSample: View {
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      Rectangle()
        .fill(.mint)
        .frame(width: 350, height: 350)
      Rectangle()
        .fill(.red)
        .frame(width: 200, height: 200)
      Text("ZStack with a\ntopLeading alignment")
    }
    .navigationTitle("ZStack with a topLeading alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ZStackAlignmentTopTrailingSample: View {
  
  var body: some View {
    ZStack(alignment: .topTrailing) {
      Rectangle()
        .fill(.mint)
        .frame(width: 350, height: 350)
      Rectangle()
        .fill(.red)
        .frame(width: 200, height: 200)
      Text("ZStack with a\ntopTrailing alignment")
    }
    .navigationTitle("ZStack with a topTrailing alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ZStackAlignmentBottomLeadingSample: View {
  
  var body: some View {
    ZStack(alignment: .bottomLeading) {
      Rectangle()
        .fill(.mint)
        .frame(width: 350, height: 350)
      Rectangle()
        .fill(.red)
        .frame(width: 200, height: 200)
      Text("ZStack with a\nbottomLeading alignment")
    }
    .navigationTitle("ZStack with a bottomLeading alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ZStackAlignmentBottomTrailingSample: View {
  
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      Rectangle()
        .fill(.mint)
        .frame(width: 350, height: 350)
      Rectangle()
        .fill(.red)
        .frame(width: 200, height: 200)
      Text("ZStack with a\nbottomTrailing alignment")
    }
    .navigationTitle("ZStack with a bottomTrailing alignment")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ZStackBackgroundSample: View {

  var body: some View {
    ZStack {
      Color.mint.ignoresSafeArea()
      Text("ZStack with a background edge to edge")
    }
    .navigationTitle("ZStack with a background edge to edge")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ZStackView_Previews: PreviewProvider {
  static var previews: some View {
    ZStackDemoView()
    ZStackDemo()
    ZStackSamples()
    ZStackAlignmentTopSample()
    ZStackAlignmentLeadingSample()
    ZStackAlignmentBottomSample()
    ZStackAlignmentTrailingSample()
    ZStackAlignmentCenterSample()
    ZStackAlignmentTopLeadingSample()
    Group {
      ZStackAlignmentTopTrailingSample()
      ZStackAlignmentBottomLeadingSample()
      ZStackAlignmentBottomTrailingSample()
      ZStackBackgroundSample()
    }
  }
}

