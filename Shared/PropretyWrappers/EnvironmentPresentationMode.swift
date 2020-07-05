//
//  EnvironmentPresentationMode.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 05/07/2020.
//

import SwiftUI

#warning("refacto")
/// cf FullScreenCoverModifier

struct EnvironmentPresentationMode: View {

  @Environment(\.presentationMode) var prensetationMode

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EnvironmentPresentationMode_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentPresentationMode()
    }
}
