//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

struct HeaderAndFooterPinnedView: View {

  let title: String

  var body: some View {
    Text(title)
      .fontWeight(.bold)
      .foregroundColor(.black)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .padding(.vertical)
      .background(Color.init(red: 255/255, green: 206/255, blue: 168/255))
  }
}
