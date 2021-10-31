//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, tvOS 13.0, Mac Catalyst 13.0
/// Description : Permet de savoir si l'utilisateur peut modifier du contenu dans la View
///
/// Définition de l'`EnvironmentValue` :
///   - var editMode: Binding<EditMode>? { get set }
///       - `EditMode` :
///         - active
///         - inactive
///         - transient
///         - isEditing : Bool 👉 indique si une View est en train d'être éditée
///
/// Remarques :
///   - On utilise cette `EnvironmentValue` très souvent avec un `EditButton` dans une `toolbar(_:)` et le modifier `disabled(_:)`
///   - ⚠️ Semble ne pas fonctionner lorsque on créer une NavigationView

struct EditMode: View {

  @StateObject private var viewModel = EditModeViewModel()
  @Environment(\.editMode) private var editMode

  var body: some View {
    VStack {
      Button("Set editMode to inactive") {
        withAnimation { editMode?.wrappedValue = .inactive }
      }
      .disabled(editMode?.wrappedValue == .inactive)
      List {
        Group {
          if editMode?.wrappedValue == .active {
            Text("EditMode : active")
              .foregroundColor(.green)
          } else if editMode?.wrappedValue == .inactive {
            Text("EditMode : inactive")
              .foregroundColor(.red)
          } else if editMode?.wrappedValue == .transient {
            Text("EditMode : transient")
              .foregroundColor(.blue)
          }
        }
        ForEach(viewModel.models) { model in
          Text(model.name)
        }
        .onMove(perform: viewModel.move)
        .onDelete(perform: viewModel.delete)
      }
    }
    .safeAreaInset(edge: .top) {
      HStack {
        Spacer()
        EditButton()
      }
      .padding(.horizontal)
    }
  }
}

struct EditMode_Previews: PreviewProvider {
  static var previews: some View {
    EditMode()
  }
}

final class EditModeViewModel: ObservableObject {

  @Published private(set) var models = EditModeModel.mocks


  func move(from indexSet: IndexSet, to index: Int) {
    models.move(fromOffsets: indexSet, toOffset: index)
  }

  func delete(at offset: IndexSet) {
    models.remove(atOffsets: offset)
  }
}

struct EditModeModel: Identifiable {
  let id = UUID()
  let name: String = String.createRandom()

  static let mocks = Array(repeating: EditModeModel(), count: Int.random(in: 30...100))
}
