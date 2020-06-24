//
//  ProgressViews.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/06/2020.
//

import SwiftUI

struct ProgressViews: View {

  @State private var valueProgressView: CGFloat = 0.5

  var body: some View {
    VStack(spacing: 30) {
      ProgressView()
        .scaleEffect(1.5, anchor: .center)
      // MARK: - value obligatoirement en @State ??
      // On peut faire ça avec un timer.publish pour faire augmenter / diminuer la value du CGFloat
      ProgressView("Test 1", value: valueProgressView, total: 1)
        .progressViewStyle(LinearProgressViewStyle())
      // Progress View classique d'Apple
      ProgressView("Test 2", value: valueProgressView)
        .progressViewStyle(CircularProgressViewStyle())
    }
  }
}

struct ProgressView_Previews: PreviewProvider {
  static var previews: some View {
    ProgressViews()
  }
}
