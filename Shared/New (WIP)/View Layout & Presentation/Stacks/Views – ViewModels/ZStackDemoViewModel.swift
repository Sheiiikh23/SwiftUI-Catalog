//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import Combine
import SwiftUI

final class ZStackDemoViewModel: ObservableObject {
  
  @Published var customAlignment: AlignmentCustom = .center
  @Published private(set) var alignment: Alignment = .center
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
