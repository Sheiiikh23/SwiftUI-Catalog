//
//
//  Copyright (c) 2020 Lucas Abijmil.

import SwiftUI

// MARK: CheckBox for ToggleStyle

/// .toggleStyle(CheckBoxToggleStyle(frame: CGFloat, colorOn: Color, colorOff: Color))

struct CheckBoxToggleStyle: ToggleStyle {

  let frame: CGFloat
  let colorOn: Color
  let colorOff: Color

  func makeBody(configuration: Self.Configuration) -> some View {
    return HStack {

      configuration.label

      Spacer()

      Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
        .resizable()
        .frame(width: frame, height: frame)
        .foregroundColor(configuration.isOn ? colorOn : colorOff)
        .font(.system(size: 20, weight: .bold, design: .default))
        .onTapGesture { configuration.isOn.toggle() }
    }
  }
}
