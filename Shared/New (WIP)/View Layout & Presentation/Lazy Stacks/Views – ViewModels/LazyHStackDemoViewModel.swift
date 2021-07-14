//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import Combine
import SwiftUI

final class LazyHStackDemoViewModel: ObservableObject {
  
  @Published var customAlignment: VerticalAlignmentCustom = .center
  @Published var spacing: CGFloat = 10
  @Published var showPinnedViews = false
  @Published private(set) var alignment: VerticalAlignment = .center
  private var subscriptions: Set<AnyCancellable> = []
  
  init() {
    setupSubscribers()
  }
  
  private func setupSubscribers() {
    customAlignmentSubscriber()
  }
  
  private func customAlignmentSubscriber() {
    $customAlignment
      .receive(on: DispatchQueue.main)
      .sink { [weak self] alignment in
        self?.alignment = alignment.value
      }
      .store(in: &subscriptions)
  }
}
