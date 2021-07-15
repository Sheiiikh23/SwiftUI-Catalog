//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import Foundation
import Combine

struct ListModel: Identifiable, Hashable {
  let id = UUID()
  let name: String
}


final class ListWithSelectionBindingSelectionValueOptionalViewModel: ObservableObject {
  
  @Published var currentSelection: ListModel?
  @Published var data: [ListModel]
  
  init() {
    data = [ListModel(name: "Lucas"), ListModel(name: "Marc"), ListModel(name: "David"), ListModel(name: "Xavier")]
  }
}

final class ListWithSelectionBindingSetSelectionValueOptionalViewModel: ObservableObject {
  
  @Published var currentSelection: Set<ListModel> = []
  @Published var datas: [ListModel]
  
  init() {
    datas = [ListModel(name: "Lucas"), ListModel(name: "Marc"), ListModel(name: "David"), ListModel(name: "Xavier")]
  }
}
