//
//  TextMarkdownView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 10/06/2021.
//

import SwiftUI

/// Text en iOS 15, supporte et interpréte le Markdown
/// Disponible sur i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst

struct TextMarkdownView: View {
  var body: some View {
    Text("This is regular text")
    Text("This is **bold text**")
    Text("This is *italic text*")
    Text("Visit Apple: [click here](https://apple.com)")
  }
}

struct TextMarkdownView_Previews: PreviewProvider {
  static var previews: some View {
    TextMarkdownView()
  }
}
