//
//
//  Copyright (c) 2020 Lucas Abijmil.

import SwiftUI

// MARK: if modifier to appply modifiers (ViewModifier struct) to the 'if' case
extension View {

  /// .ifModifier(for: $tapped, with: RedLabelModifier())
  func ifModifier<T>(for condition: Binding<Bool>, with modifier: T) -> some View where T: ViewModifier {
    Group {
      if condition.wrappedValue {
        self.modifier(modifier)
      } else {
        self
      }
    }
  }

  func ifModifier<T>(for condition: Bool, with modifier: T) -> some View where T: ViewModifier {
    Group {
      if condition {
        self.modifier(modifier)
      } else {
        self
      }
    }
  }
}
