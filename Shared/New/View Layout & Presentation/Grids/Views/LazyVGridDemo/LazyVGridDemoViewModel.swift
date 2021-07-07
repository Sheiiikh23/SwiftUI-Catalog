//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import Combine
import SwiftUI

final class LazyVGridDemoViewModel: ObservableObject {

  @Published var itemCustomType: GridItemType = .fixed
  @Published var itemType: GridItem.Size = .fixed(0)
  @Published var itemSize: CGFloat = 100
  @Published var itemMinSize: CGFloat = 100
  @Published var itemMaxSize: CGFloat = 500
  @Published var showMinMaxSize = false
  @Published var itemSpacing: CGFloat = 10
  @Published var itemAlignmentCustom: AlignmentCustom = .center
  @Published var gridItemCount = 3
  @Published var gridItemAlignmentcustom: HorizontalAlignmentCustom = .center
  @Published var gridSpacing: CGFloat = 10
  @Published var gridShowPinnedViews = false
  @Published private(set) var gridAlignment: HorizontalAlignment = .center
  @Published private(set) var itemAlignment: Alignment = .center

  private var subscriptions: Set<AnyCancellable> = []

  init() {
    setupSubscribers()
  }

  private func setupSubscribers() {
    gridItemCustomTypeSubscriber()
    showMinMaxSizeSubscriber()
    itemAlignmentSubscriber()
    gridAlignmentSubscriber()
  }

  private func gridAlignmentSubscriber() {
    $gridItemAlignmentcustom
      .receive(on: DispatchQueue.main)
      .sink { [weak self] alignment in
        switch alignment {
        case .leading:
          self?.gridAlignment = .leading
        case .center:
          self?.gridAlignment = .center
        case .trailing:
          self?.gridAlignment = .trailing
        }
      }
      .store(in: &subscriptions)
  }

  private func itemAlignmentSubscriber() {
    $itemAlignmentCustom
      .receive(on: DispatchQueue.main)
      .sink { [weak self] alignment in
        switch alignment {
        case .top:
          self?.itemAlignment = .top
        case .leading:
          self?.itemAlignment = .leading
        case .bottom:
          self?.itemAlignment = .bottom
        case .trailing:
          self?.itemAlignment = .trailing
        case .center:
          self?.itemAlignment = .center
        case .topLeading:
          self?.itemAlignment = .topLeading
        case .topTrailing:
          self?.itemAlignment = .topTrailing
        case .bottomLeading:
          self?.itemAlignment = .bottomLeading
        case .bottomTrailing:
          self?.itemAlignment = .bottomTrailing
        }
      }
      .store(in: &subscriptions)
  }

  private func showMinMaxSizeSubscriber() {
    $itemCustomType
      .receive(on: DispatchQueue.main)
      .sink { [weak self] itemType in
        switch itemType {
        case .adaptive:
          self?.showMinMaxSize = true
          self?.gridItemCount = 1
        case .flexible:
          self?.showMinMaxSize = true
        case .fixed:
          self?.showMinMaxSize = false
        }
      }
      .store(in: &subscriptions)
  }

  private func gridItemCustomTypeSubscriber() {
    $itemCustomType
      .receive(on: DispatchQueue.main)
      .sink { [weak self] itemType in
        guard let self = self else { return }
        switch itemType {
        case .adaptive:
          self.itemType = .adaptive(minimum: self.itemMinSize, maximum: self.itemMaxSize)
        case .fixed:
          self.itemType = .fixed(self.itemSize)
        case .flexible:
          self.itemType = .flexible(minimum: self.itemMinSize, maximum: self.itemMaxSize)
        }
      }
      .store(in: &subscriptions)
  }
}
