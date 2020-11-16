//
//  TextConcatenation.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 16/11/2020.
//

import SwiftUI

/// On a la possibilité de concaténer des Text en tant que View
/// Plutôt pas mal si on ne veut pas appliquer les mêmes modifiers à des mots / caractères

// MARK: - Utilisation : Appliquer des modifiers différents à des mots / caractères pour une même phrase

struct TextConcatenation: View {
  var body: some View {
    VStack {
      Text("Bleu ")
        .fontWeight(.heavy)
        .foregroundColor(.blue)
      +
      Text("Blanc ")
        .fontWeight(.bold)
        .foregroundColor(.white)
      +
      Text("Rouge")
        .fontWeight(.semibold)
        .foregroundColor(.red)
      Text("Je ")
        .fontWeight(.heavy)
        .foregroundColor(.blue)
      +
      Text("François ")
        .fontWeight(.bold)
        .foregroundColor(.white)
      +
      Text("le français !")
        .fontWeight(.semibold)
        .foregroundColor(.red)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.black)
  }
}

struct TextConcatenation_Previews: PreviewProvider {
  static var previews: some View {
    TextConcatenation()
  }
}
