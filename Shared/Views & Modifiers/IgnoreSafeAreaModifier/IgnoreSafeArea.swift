//
//  IgnoreSafeArea.swift
//  iOS
//
//  Created by Lucas Abijmil on 10/07/2021.
//

import SwiftUI

#warning("TO DO – FIXME")
// FIXME: Clean me
// Faire un esemble avec le keyboard également

struct IgnoreSafeArea: View {
    var body: some View {
      ZStack(alignment: .bottom) {
        Color.orange.ignoresSafeArea()
        HStack {
          Text("Primary content")
          Spacer()
          Text("Cool content")
            .foregroundStyle(LinearGradient(colors: [.blue, .indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
          Spacer()
          Text("Secondary content")
//            .foregroundColor(.secondary)
            .foregroundStyle(.secondary) // A utiliser si utilisation d'un Material en background ou pour faire des trucs stylé que le foregroundColor ne peut pas réaliser
        }
        .padding()
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16))
      }
    }
}

struct IgnoreSafeArea_Previews: PreviewProvider {
    static var previews: some View {
        IgnoreSafeArea()
    }
}
