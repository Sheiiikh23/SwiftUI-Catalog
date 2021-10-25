//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Une `View` qui présente des rows de data, avec la possibilité d'en sélectionner une ou plusieur
///
/// X init pour une `List`:
///   - `List with Arbitrary Content` : permet d'avoir le layout d'une `List` sans tirer parti de l'aspect "data" et donc de pouvoir déclarer chaque row
///       • init(@ViewBuilder content: () -> Content) where Content : View (cf `ListWithContentViewBuilder`)
///       • init(selection: Binding<SelectionValue?>?, @ViewBuilder content: () -> Content) where SelectionValue : Hashable, Content : View (cf `ListWithSelectionBindingSelectionValueOptional`)
///       • init(selection: Binding<Set<SelectionValue>>?, @ViewBuilder content: () -> Content) where SelectionValue : Hashable, Content : View (cf `ListWithSelectionBindingSetSelectionValueOptional`)
///
/// Paramètres :
///   - @ViewBuilder content: () -> Content ––> un ensemble de `View` (maximum 10 subviews)
///   - selection: Binding<SelectionValue?>? ––> permet de pouvoir sélectionner une row (ou zéro)
///   - selection: Binding<Set<SelectionValue>>? ––> permet de pouvoir sélectionner une ou plusieurs rows (ou zéro)
///
/// Remarques :
///   - Une `List` avec le paramètre `selection` doit obligatoirement avoir un `EditButton` dans sa `View`


fileprivate enum Sample: String, Identifiable, CaseIterable {
  case arbitraryContent = "List with Arbitrary Content"
  
  var id: String { rawValue }
  
  @ViewBuilder var destination: some View {
    switch self {
    case .arbitraryContent:
      NavigationLink("List with @ViewBuilder content: () -> Content", destination: ListWithContentViewBuilder())
      NavigationLink("List with selection: Binding<SelectionValue?>? & @ViewBuilder content: () -> Content", destination: ListWithSelectionBindingSelectionValueOptional())
      NavigationLink("List with selection: Binding<Set<SelectionValue>>? & @ViewBuilder content: () -> Content", destination: ListWithSelectionBindingSetSelectionValueOptional())
    }
  }
}

struct ListSample: View {
  
  var body: some View {
    NavigationView {
      List {
        ForEach(Sample.allCases) { sample in
          Section(sample.rawValue) {
            sample.destination
          }
        }
      }
      .navigationTitle("List sample")
    }
  }
}

// MARK: - List with Arbitrary Content

// Permet d'avoir le layout d'une list sans forcémment utilisé l'aspect "data" (Collection, Range etc...)
struct ListWithContentViewBuilder: View {
  var body: some View {
    List {
      Text("1st row")
      Text("I don't want to count this row")
      Text("2nd row")
      Button("Here's a button") {}
      Text("You can do (almost) anything you want")
        .foregroundColor(.red)
    }
  }
}

// Obligé d'avoir le `EditButton`
struct ListWithSelectionBindingSelectionValueOptional: View {
  
  @StateObject private var viewModel = ListWithSelectionBindingSelectionValueOptionalViewModel()
  
  var body: some View {
    NavigationView {
      List(selection: $viewModel.currentSelection) {
        ForEach(viewModel.data, id: \.self) { model in
          Text(model.name)
        }
      }
      .toolbar {
          EditButton()
      }
    }
  }
}



// Obligé d'avoir le `EditButton`
struct ListWithSelectionBindingSetSelectionValueOptional: View {
  
  @StateObject private var viewModel = ListWithSelectionBindingSetSelectionValueOptionalViewModel()
  
  var body: some View {
    NavigationView {
      List(selection: $viewModel.currentSelection) {
        ForEach(viewModel.datas, id: \.self) { data in
          Text(data.name)
        }
      }
      .toolbar {
        EditButton()
      }
    }
  }
}


struct List_Previews: PreviewProvider {
  static var previews: some View {
    Text("")
  }
}
