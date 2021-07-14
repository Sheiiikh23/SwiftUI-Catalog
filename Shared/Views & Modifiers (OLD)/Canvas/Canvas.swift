//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

// C'est une shape donc prend toute la width & height disponible

#warning("TO DO")

struct CanvasView: View {

  let symbols = SFSymbol.allCases

  var body: some View {
    Canvas { context, size in
      let metrics = gridMetrics(in: size)
      for (index, symbol) in symbols.enumerated() {
        let rect = metrics[index]
        let image = context.resolve(Image(systemName: symbol.rawValue))
        context.draw(image, in: rect.fit(image.size))
      }
    }
  }

  func gridMetrics(in size: CGSize) -> SymbolGridMetrics {
    return SymbolGridMetrics(size: size, numberOfSymbols: symbols.count)
  }
}

struct CanvasWithGesture: View {

  let symbols = SFSymbol.allCases
  @GestureState private var focalPoint: CGPoint?

  var body: some View {
    Canvas { context, size in
      let metrics = gridMetrics(in: size)
      for (index, symbol) in symbols.enumerated() {
        let rect = metrics[index]
        let (sRect, opacity) = rect.fishEyeTransform(around: focalPoint)
        context.opacity = opacity
        let image = context.resolve(Image(symbol.rawValue))
        context.draw(image, in: sRect.fit(image.size))
      }
    }
    .gesture(
      DragGesture(minimumDistance: 0)
        .updating($focalPoint) { value, focalPoint, _ in
      focalPoint = value.location
    })
    .accessibilityLabel("Symbol browser")
    .accessibilityChildren {
      List(symbols) { Text($0.rawValue) }
    }
  }

  func gridMetrics(in size: CGSize) -> SymbolGridMetrics {
    return SymbolGridMetrics(size: size, numberOfSymbols: symbols.count)
  }
}

struct CanvasWithTimeLineView: View {

  let symbols = SFSymbol.allCases

  var body: some View {
    TimelineView(.animation) { // TODO:
      let time = $0.date.timeIntervalSince1970
      Canvas { context, size in
        let metrics = gridMetrics(in: size)
        let focalPoint = focalPoint(at: time, in: size)
        for (index, symbol) in symbols.enumerated() {
          let rect = metrics[index]
          let (sRect, opacity) = rect.fishEyeTransform(around: focalPoint, at: time)
          context.opacity = opacity
          let image = context.resolve(Image(systemName: symbol.rawValue))
          context.draw(image, in: sRect.fit(image.size))
        }
      }
    }
  }

  func gridMetrics(in size: CGSize) -> SymbolGridMetrics {
    return SymbolGridMetrics(size: size, numberOfSymbols: symbols.count)
  }
}

struct ImageCanvasSample: View {

  @State private var count = 2

  var body: some View {
    TimelineView(.animation) { timeline in

      let now = timeline.date.timeIntervalSinceReferenceDate
      let angle = Angle.degrees(now.remainder(dividingBy: 3) * 120)
      let x = cos(angle.radians)

      // closure run every time the canvas is drawn and contain our drawing command (= drawRect in UIKit
      // Paramètre : context = drawing command, size : size of the entire canvas
      // La closure n'est pas un @ViewBuilder
      // Dans la closure c'est du code impératif qui tourne et pas déclaratif
      Canvas { context, size in
        var image = context.resolve(Image(systemName: SFSymbol.sparkle.rawValue)) // le `context.resolve(_: Image)` ou `context.resolve(_: Text)` est plus optimisé que déclaré des `Image` ou `Text directement
        image.shading = .color(.blue)
        let imageSize = image.size
        context.blendMode = .screen
        for i in 0..<count {
          let frame = CGRect(x: 0.5 * size.width + Double(i) * imageSize.width * x, y: 0.5 * size.height, width: imageSize.width, height: imageSize.height)
          var innerContext = context
          innerContext.opacity = 0.5
          innerContext.fill(Ellipse().path(in: frame), with: .color(.cyan)) // les `View` conforme à `Shape` peuvent être utilisé dans la méthode `context.fill` (permet de rajouter un background)
          context.draw(image, in: frame)
        }
      }
    }
    .onTapGesture { count += 1 }
    .accessibilityLabel("A paricle visualizer")
  }
}

struct CanvasView_Previews: PreviewProvider {
  static var previews: some View {
    ImageCanvasSample()
  }
}

struct Symbol: Identifiable {
  let name: String
  var id: String { name }
  var image: Image { Image(systemName: name) }

  init(_ name: String) {
    self.name = name
  }
}

struct SymbolGridMetrics {
  let symbolWidth: CGFloat
  let symbolsPerRow: Int
  let numberOfSybols: Int
  let insetProportion: CGFloat

  init(size: CGSize, numberOfSymbols: Int, insetProportion: CGFloat = 0.1) {
    let areaPerSymbol = (size.width * size.height) / CGFloat(numberOfSymbols)
    self.symbolsPerRow = Int(size.width / sqrt(areaPerSymbol))
    self.symbolWidth = size.width / CGFloat(symbolsPerRow)
    self.numberOfSybols = numberOfSymbols
    self.insetProportion = insetProportion
  }

  subscript(_ index: Int)  -> CGRect {
    precondition(index >= 0 && index < numberOfSybols)
    let row = index / symbolsPerRow
    let columns = index % symbolsPerRow
    let rect = CGRect(x: CGFloat(columns) * symbolWidth, y: CGFloat(row) * symbolWidth, width: symbolWidth, height: symbolWidth)
    return rect.insetBy(dx: symbolWidth * insetProportion, dy: symbolWidth * insetProportion)
  }
}
