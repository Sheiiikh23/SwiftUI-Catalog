//
//
//  Copyright (c) 2020 Lucas Abijmil.

import SwiftUI

// MARK: if else modifier to appply modifiers (ViewModifier struct) to the 'if' case or to the 'else' case
extension View {

  /// .ifElseModifier(for: $tapped, if: RedLabelModifier(), else: GreenLabelModifier())
  func ifElseModifier<M1, M2>(for condition: Binding<Bool>, if trueModifier: M1, else falseModifier: M2) -> some View where M1: ViewModifier, M2: ViewModifier {
    Group {
      if condition.wrappedValue {
        self.modifier(trueModifier)
      } else {
        self.modifier(falseModifier)
      }
    }
  }

  func ifElseModifier<M1, M2>(for condition: Bool, if trueModifier: M1, else falseModifier: M2) -> some View where M1: ViewModifier, M2: ViewModifier {
    Group {
      if condition {
        self.modifier(trueModifier)
      } else {
        self.modifier(falseModifier)
      }
    }
  }
}
