//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, Mac Catalyst 15.0
/// Description : Permet de choisir le style d'un SF Symbol au sein d'une `Image` ou `Label
///
/// 1 seule signature :
///   - func symbolVariant(_ variant: SymbolVariants) -> some View
///
/// Paramètre :
///   - variant : `SymbolVariants`
///     - none ––> `outline` style
///     - slash ––> `slash` style
///     - circle, rectangle, square ––> `enclosing` style avec shape
///     - fill ––> `fill` style
///
/// Remarque :
///   - Ce modifier correspond à la concaténation dans la string du SF Sybol sans ce soucier de l'ordre
///   - Ordre commun  : .slash (ou non) puis .shape (ou non) puis .fill (ou non)
///   
/// Tips :
///   - On peut enchainer les styles au sein d'un seul `symbolVariant(_:)` sans ce soucier d'un ordre quelconque
///   - Les actions dans un un `swipeAction` sont `fill` afin d'accentuer la zone de touch
///   - Les styles `enclosing` & `fill` combinés permettent une meilleur lisibilité pour les petites tailles
///   - Le style `outline` est idéal au sein d'une Toolbar, NavigationView, List et où les symbols sont à côté de texte

struct SymbolVariantModifier: View {

  var body: some View {
    ScrollView {
      VStack(spacing: 30) {
        VStack(spacing: 15) {
          Image(systemName: "trash")
            .symbolVariant(.none)
            .foregroundColor(.red)
          Image(systemName: "trash")
            .symbolVariant(.slash)
            .foregroundColor(.mint)
          Image(systemName: "trash")
            .symbolVariant(.circle)
            .foregroundColor(.pink)
          HStack {
            Image(systemName: "trash")
              .symbolVariant(.slash.circle)
            Image(systemName: "trash")
              .symbolVariant(.circle.slash)
          }
          .foregroundColor(.purple)
          Image(systemName: "trash")
            .symbolVariant(.fill)
            .foregroundColor(.indigo)
          HStack {
            Image(systemName: "trash")
              .symbolVariant(.slash.fill)
            Image(systemName: "trash")
              .symbolVariant(.fill.slash)
          }
          .foregroundColor(.yellow)
          HStack {
            Image(systemName: "trash")
              .symbolVariant(.slash.circle.fill)
            Image(systemName: "trash")
              .symbolVariant(.slash.fill.circle)
            Image(systemName: "trash")
              .symbolVariant(.circle.slash.fill)
            Image(systemName: "trash")
              .symbolVariant(.circle.fill.slash)
            Image(systemName: "trash")
              .symbolVariant(.fill.slash.circle)
            Image(systemName: "trash")
              .symbolVariant(.fill.circle.slash)
          }
          .foregroundColor(.green)
        }
        .font(.system(size: 50, weight: .regular))
        VStack(spacing: 15) {
          Label("Trash", systemImage: "trash")
            .symbolVariant(.none)
            .foregroundColor(.red)
          Label("Trash", systemImage: "trash")
            .symbolVariant(.slash)
            .foregroundColor(.mint)
          Label("Trash", systemImage: "trash")
            .symbolVariant(.circle)
            .foregroundColor(.pink)
          HStack {
            Label("Trash", systemImage: "trash")
              .symbolVariant(.slash.circle)
            Label("Trash", systemImage: "trash")
              .symbolVariant(.circle.slash)
          }
          .foregroundColor(.purple)
          Label("Trash", systemImage: "trash")
            .symbolVariant(.fill)
            .foregroundColor(.indigo)
          HStack {
            Label("Trash", systemImage: "trash")
              .symbolVariant(.slash.fill)
            Label("Trash", systemImage: "trash")
              .symbolVariant(.fill.slash)
          }
          .foregroundColor(.yellow)
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
              Label("Trash", systemImage: "trash")
                .symbolVariant(.slash.circle.fill)
              Label("Trash", systemImage: "trash")
                .symbolVariant(.slash.fill.circle)
              Label("Trash", systemImage: "trash")
                .symbolVariant(.circle.slash.fill)
              Label("Trash", systemImage: "trash")
                .symbolVariant(.circle.fill.slash)
              Label("Trash", systemImage: "trash")
                .symbolVariant(.fill.slash.circle)
              Label("Trash", systemImage: "trash")
                .symbolVariant(.fill.circle.slash)
            }
            .foregroundColor(.green)
          }
        }
        .font(.system(size: 35, weight: .regular))
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.black)
  }
}

struct SymbolVariantModifier_Previews: PreviewProvider {
  static var previews: some View {
    SymbolVariantModifier()
  }
}
