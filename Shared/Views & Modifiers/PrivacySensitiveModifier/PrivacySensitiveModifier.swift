//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

#warning("TO DO")

// Fonctionne aussi avec les widgets (écran locké ou non)

struct PrivacySensitiveModifier: View {

  @State private var showSensitiveContent = false

  var body: some View {
    Button {
      showSensitiveContent.toggle()
    } label: {
      VStack {
        Text("Account #")

        Text("accountNumber")
          .font(.headline)
          .privacySensitive(showSensitiveContent)
      }
    }
  }
}

struct PrivacySensitiveModifier_Previews: PreviewProvider {
  static var previews: some View {
    PrivacySensitiveModifier()
  }
}
