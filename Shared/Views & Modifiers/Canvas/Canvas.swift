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
  }

  func gridMetrics(in size: CGSize) -> SymbolGridMetrics {
    return SymbolGridMetrics(size: size, numberOfSymbols: symbols.count)
  }
}

struct CanvasWithAccessibilityChildren: View {

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
  #warning("DEBUG")
  subscript(_ index: Int)  -> CGRect {
    precondition(index >= 0 && index < numberOfSybols) // WTF IS THIS
    let row = index / symbolsPerRow
    let columns = index % symbolsPerRow
    let rect = CGRect(x: CGFloat(columns) * symbolWidth, y: CGFloat(row) * symbolWidth, width: symbolWidth, height: symbolWidth)
    return rect.insetBy(dx: symbolWidth * insetProportion, dy: symbolWidth * insetProportion)
  }
}

extension CGRect {

  func fit(_ otherSize: CGSize) -> CGRect {
    let scale = min(size.width / otherSize.width, size.height / otherSize.height)
    let newSize = CGSize(width: otherSize.width * scale, height: otherSize.height * scale)
    let newOrigin = CGPoint(x: midX - newSize.width / 2, y: midY - newSize.height / 2)
    return CGRect(origin: newOrigin, size: newSize)
  }

  func fishEyeTransform(around point: CGPoint?, radius: CGFloat = 200, zoom: CGFloat = 3.0) -> (frame: CGRect, opacity: CGFloat) {
    guard let point = point else { return (self, 1.0) }

    let deltaX = midX - point.x
    let deltaY = midY - point.y
    let distance = sqrt(deltaX * deltaX + deltaY * deltaY)
    let theta = atan2(deltaY, deltaX)
    let scaledClampedDistance = pow(min(1, max(0, distance / radius)), 0.7)
    let scale = (1.0 - scaledClampedDistance) * zoom + 0.5
    let newOffset = distance * (2.0 - scaledClampedDistance) * sqrt(zoom)
    let newDeltaX = newOffset * cos(theta)
    let newDeltaY = newOffset * sin(theta)
    let newSize = CGSize(width: size.width * scale, height: size.height * scale)
    let newOrigin = CGPoint(x: (newDeltaX + point.x) - newSize.width / 2, y: (newDeltaY + point.y) - newSize.height / 2)
    let opacity = max(0.1, 1.0 - scaledClampedDistance)
    return (CGRect(origin: newOrigin, size: newSize), opacity)
  }

  func fishEyeTransform(around point: CGPoint, at time: TimeInterval) -> (frame: CGRect, opacity: CGFloat) {
    let zoom = cos(time) + 3.0
    let radius = ((cos(time / 5) + 1) / 2) * 150 + 150
    return fishEyeTransform(around: point, radius: radius, zoom: zoom)
  }
}

func focalPoint(at time: TimeInterval, in size: CGSize) -> CGPoint {
  let offset: CGFloat = min(size.width, size.height) / 4
  let distance = ((sin(time / 5) + 1) / 2) * offset + offset
  let scalePoint = CGPoint(x: size.width / 2 + distance * cos(time / 2), y: size.height / 2 + distance * sin(time / 2))
  return scalePoint
}
