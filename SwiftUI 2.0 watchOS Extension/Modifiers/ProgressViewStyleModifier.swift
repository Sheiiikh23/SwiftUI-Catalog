//
//  ProgressViewStyleModifier.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import SwiftUI

#warning("Refacto description")
#warning("Pas d'affichage de label pour le moment. a voir dans les prochaine update normalement c'est un bug")

struct ProgressViewStyleModifier: View {
    var body: some View {
      VStack(spacing: 20) {
        ProgressView(value: 0.7) {
          Image(systemName: "music.note")
        }
        .progressViewStyle(CircularProgressViewStyle(tint: .red))
        VStack(alignment: .leading) {
          Text("Water Reminded")
            .foregroundColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
          Text("32 oz. consumed")
          ProgressView(value: 0.7)
            .progressViewStyle(LinearProgressViewStyle(tint: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))))
        }
      }
    }
}

struct ProgressViewStyleModifier_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewStyleModifier()
    }
}
