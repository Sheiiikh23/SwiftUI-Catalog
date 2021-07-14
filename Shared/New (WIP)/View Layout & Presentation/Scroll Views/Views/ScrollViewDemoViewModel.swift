//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import Combine
import SwiftUI

final class ScrollViewDemoViewModel: ObservableObject {

  @Published var showsIndicators = true
  @Published var customAxes: CustomAxis = .vertical
  @Published private(set) var axes: Axis.Set = .vertical
  private var subscriptions: Set<AnyCancellable> = []

  init() {
    setupSubscribers()
  }

  private func setupSubscribers() {
    axesSubscriber()
  }

  private func axesSubscriber() {
    $customAxes
      .receive(on: DispatchQueue.main)
      .sink { [weak self] axe in
        self?.axes = axe.value
      }
      .store(in: &subscriptions)
  }
}
