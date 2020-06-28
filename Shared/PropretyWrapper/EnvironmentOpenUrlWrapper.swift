//
//  EnvironmentOpenUrlWrapper.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 28/06/2020.
//

import SwiftUI

#warning("Refacto")

struct EnvironmentOpenUrlWrapper: View {

  @Environment(\.openURL) var test

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EnvironmentOpenUrlWrapper_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentOpenUrlWrapper()
    }
}
