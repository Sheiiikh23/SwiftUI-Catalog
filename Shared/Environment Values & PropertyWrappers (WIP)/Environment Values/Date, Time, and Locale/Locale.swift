//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet d'accéder à des informations sur les convetions linguistiques, culturelles etc pour le formatage dans le layout
///
/// Définition de l`EnvironmentValue`:
///   - var locale: Locale { get set }
///
/// Remarque :
///   - Pour plus d'infos sur `Locale`, c'est ici : https://developer.apple.com/documentation/foundation/locale
///   - Tous les identifiers de `Locale` sont disponibles, ici : https://gist.github.com/jacobbubu/1836273

struct Locale: View {

  @Environment(\.locale) private var locale

  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 15) {
        Text("Locale informations")
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(.red)
          .padding()
          .background(.indigo, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
        Group {
          Text("Identifier : \(locale.identifier)")
          Text("Calendar : \(locale.calendar)")
          Text("Region code : \(locale.regionCode.orEmpty)")
          Text("Language code : \(locale.languageCode.orEmpty)")
          Text("Script code : \(locale.scriptCode.orEmpty)")
          Text("Variant code : \(locale.variantCode.orEmpty)")
          Text("Exemplar character set : \(locale.exemplarCharacterSet ?? CharacterSet())")
          Text("Collation identifier : \(locale.collationIdentifier.orEmpty)")
        }
        Group {
          Text("Collator identifier : \(locale.collatorIdentifier.orEmpty)")
          Text("Uses meetric system : \(locale.usesMetricSystem.description)")
          Text("Decimal separator : \(locale.decimalSeparator.orEmpty)")
          Text("Grouping separator : \(locale.groupingSeparator.orEmpty)")
          Text("Currency code : \(locale.currencyCode.orEmpty)")
          Text("Currency symbol : \(locale.currencySymbol.orEmpty)")
          Text("Quotation begin delimiter : \(locale.quotationBeginDelimiter.orEmpty)")
          Text("Quotation end delimiter : \(locale.quotationEndDelimiter.orEmpty)")
          Text("Alternate quotation begin delimiter : \(locale.alternateQuotationBeginDelimiter.orEmpty)")
          Text("Alternate quotation end delimiter : \(locale.alternateQuotationEndDelimiter.orEmpty)")
        }
      }
    }
  }
}

struct Locale_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Locale()
      Locale()
        .environment(\.locale, SwiftUI.Locale(identifier: "fr-FR"))
    }
  }
}
