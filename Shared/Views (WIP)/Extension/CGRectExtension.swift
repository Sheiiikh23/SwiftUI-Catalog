//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

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
