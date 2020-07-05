//
//  EnvironmentOpenUrl.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

#warning("Refacto")

struct EnvironmentOpenUrl: View {

  @Environment(\.openURL) var test

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EnvironmentOpenUrl_Previews: PreviewProvider {
    static var previews: some View {
      EnvironmentOpenUrl()
    }
}
