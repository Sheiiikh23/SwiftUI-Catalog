//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 14.0, macOS 10.15, Mac Catalyst 14.0
/// Description : Une `View` "container" qui rassemble visuellement un groupe logique de contenu avec un label optionnel.
///
/// 5 init pour une `GroupBox` : 1 deprecated à partir d'i•Pad•OS 15.0, macOS 12.0, Mac Catalyst 15.0
///   - init(@ViewBuilder content: () -> Content) where Content : View ; i•Pad•OS 14.0, macOS 10.15, Mac Catalyst 14.0
///   - init(label: Label, @ViewBuilder content: () -> Content) where Content : View ; i•Pad•OS 14.0, macOS 10.15, Mac Catalyst 14.0 deprecated à partir d'i•Pad•OS 15.0, macOS 12.0, Mac Catalyst 15.0 👇
///   - init(@ViewBuilder content: () -> Content, @ViewBuilder label: () -> Label) where Label : View, Content : View ; i•Pad•OS 15.0, macOS 12.0, Mac Catalyst 15.0
///   - init(_ titleKey: LocalizedStringKey, @ViewBuilder content: () -> Content) where Content : View ; i•Pad•OS 15.0, macOS 12.0, Mac Catalyst 15.0
///   - init<S>(_ title: S, @ViewBuilder content: () -> Content) where S : StringProtocol, Content : View ; i•Pad•OS 15.0, macOS 12.0, Mac Catalyst 15.0
///
/// Paramètres :
///   - @ViewBuilder content () -> Content ––> un semble de `View` (maximum 10 subviews)
///   - label: Label, @ViewBuilder content: () -> Content where Label : some View ––> deux @ViewBuilder pouvant contenir chacun maximum 10 subviews
///   - @ViewBuilder content: () -> Content, @ViewBuilder label: () -> Label ––> deux @ViewBuilder pouvant contenir chacun maximum 10 subviews
///   - titleKey: LocalizedStringKey, @ViewBuilder content: () -> Content ––> une `String` et un @ViewBuilder pouvant contenir maximum 10 subviews
///   - title: S, @ViewBuilder content: () -> Content where S : StringProtocol ––> une `String` et un @ViewBuilder pouvant contenir maximum 10 subviews
///
/// Remarques :
///   - Sur iOS la UI par défaut est une card similaire à celle dans l'application Santé
///   - Le Label est une `View` optionnel, avec un alignment en leading par défaut
///   - Le content à l'air d'être placé dans un `VStack` implicite
///   - Une `GroupeBox` peut contenir d'autre `GroupBox` et ainsi de suite

struct GroupBoxDemoView: View {

  var body: some View {
    TabView {
      GroupBoxView()
        .tag(TabItem.view)
        .tabItem { Label("View", systemImage: "shippingbox") }

      GroupBoxViewSamples()
        .tag(TabItem.sample)
        .tabItem { Label("Samples", systemImage: "magazine") }
    }
  }
}

fileprivate enum TabItem {
  case view
  case sample
}

struct GroupBoxView: View {

  @State private var showLabel = true

  var body: some View {
    if showLabel {
      GroupBox {
        Text("13 ")
          .font(.title)
          .fontWeight(.bold)
        +
        Text("étages")
          .font(.title3)
          .fontWeight(.semibold)
        Text("Beaucoup de sport aujourd'hui ! 😅")
        Toggle("Show lanel", isOn: $showLabel)
      } label: {
        Label("Étages montés", systemImage: "flame.fill")
          .foregroundColor(.orange)
      }
      .padding(.horizontal)
    } else {
      GroupBox {
        Text("13 ")
          .font(.title)
          .fontWeight(.bold)
        +
        Text("étages")
          .font(.title3)
          .fontWeight(.semibold)
        Text("Beaucoup de sport aujourd'hui ! 😅")
        Toggle("Show lanel", isOn: $showLabel)
      }
      .padding(.horizontal)

    }
  }
}

struct GroupBoxViewSamples: View {

  var body: some View {
    VStack(spacing: 25) {

      /// init : @ViewBuilder content () -> Content
      GroupBox {
        Text("Pourquoi pas du text par ici")
        Label("Un petit badge par là", systemImage: "folder.fill.badge.gearshape")
      }

      /// init : label: Label, @ViewBuilder content: () -> Content where Label : some View
      /// Deprecated
      GroupBox(label: Label("Étages montés", systemImage: "flame.fill").foregroundColor(.orange)) {
        Text("13 ")
          .font(.title)
          .fontWeight(.bold)
        +
        Text("étages")
          .font(.title3)
          .fontWeight(.semibold)
      }
      .padding(.horizontal)

      /// init : @ViewBuilder content: () -> Content, @ViewBuilder label: () -> Label
      GroupBox {
        Text("13 ")
          .font(.title)
          .fontWeight(.bold)
        +
        Text("étages")
          .font(.title3)
          .fontWeight(.semibold)
        Text("Beaucoup de sport aujourd'hui ! 😅")
      } label: {
        Label("Étages montés", systemImage: "flame.fill")
          .foregroundColor(.orange)
      }
      .padding(.horizontal)

      /// init : titleKey: LocalizedStringKey, @ViewBuilder content: () -> Content
      /// init : title: S, @ViewBuilder content: () -> Content where S : StringProtocol
      GroupBox("Titre du GroupBox") {
        Text("Pourquoi pas du text par ici")
        Label("Un petit badge par là", systemImage: "folder.fill.badge.gearshape")
      }

      /// Rendu lorsqu'une `GroupBox` contient une autre `GroupBox` et ainsi de suite
      GroupBox {
        Text("Outer content")
        GroupBox {
          Text("Middle content")
          GroupBox {
            Text("Inner content")
          }
        }
      }
    }
  }
}

struct GroupBoxView_Previews: PreviewProvider {
  static var previews: some View {
    GroupBoxViewSamples()
  }
}
