//
//  Locale.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 10/09/2020.
//

import SwiftUI

/// locale permet d'accéder à des information concernant les infos locale de l'utilisateur
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// locale: Locale { get set }
/// Pas mal d'informations pour le formatage des données tel que :
///   • convention linguistiques
///   • convention culturelle
///   • convention technologique
///
/// + d'info sur le type Locale ici : https://developer.apple.com/documentation/foundation/locale

// MARK: - Importance pour l'accessibilité : moyenne – élevée
// MARK: - Utilisation : Permet de formatter les données en fonctions des langues (préférable d'utiliser des LocalizedStrings)

struct Locale: View {

  @Environment(\.locale) private var locale

  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      Text("Informations locale")
        .font(.title)
        .fontWeight(.bold)
        .padding(.horizontal, 20)
        .padding(.vertical)
        .background(Color.red.opacity(0.33))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
        .frame(maxWidth: .infinity, alignment: .center)
      if let regionCode = locale.regionCode,
         let languageCode = locale.languageCode,
         let exemplarCharacterSet = locale.exemplarCharacterSet,
         let collatorIdentifier = locale.collatorIdentifier,
         let decimalSeparator = locale.decimalSeparator,
         let groupingSeparator = locale.groupingSeparator,
         let currencyCode = locale.currencyCode,
         let currencySymbol = locale.currencySymbol,
         let quotationBeginDelimiter = locale.quotationBeginDelimiter,
         let quotationEndDelimiter = locale.quotationEndDelimiter,
         let alternateQuotationBeginDelimiter = locale.alternateQuotationBeginDelimiter,
         let alternateQuotationEndDelimiter = locale.alternateQuotationEndDelimiter {
        Text("Local ID : \(locale.identifier)")
        Text("Local calendar : \(locale.calendar)")
        Text("Region code : \(regionCode)")
        Text("Language code : \(languageCode)")
        Text("Examplar character set : \(exemplarCharacterSet)")
        Text("Collator Identifier : \(collatorIdentifier)")
        Text("Locale uses the metric system ?" + (locale.usesMetricSystem ? " Yes" : " No"))
        Text("Decimal separator : \(decimalSeparator)")
        Text("Grouping separator : \(groupingSeparator)")
        Group {
          Text("Currency code : \(currencyCode)")
          Text("Currency symbol : \(currencySymbol)")
          Text("Quotation begin delimiter : \(quotationBeginDelimiter)")
          Text("Quotation end delimiter : \(quotationEndDelimiter)")
          Text("Alternate quotation begin delimiter : \(alternateQuotationBeginDelimiter)")
          Text("Alternate quotation end delimiter : \(alternateQuotationEndDelimiter)")
        }
      }
    }
  }
}

struct Locale_Previews: PreviewProvider {
  static var previews: some View {
    Locale()
  }
}


struct RedLabel: ViewModifier {

  func body(content: Content) -> some View {
    content
      .foregroundColor(.red)
  }
}

struct BlueLabel: ViewModifier {

  func body(content: Content) -> some View {
    content
      .foregroundColor(.blue)
  }
}
