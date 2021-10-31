//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateformes : i•Pad•OS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, Mac Catalyst 13.0
/// Description : Permet de faire des opérations CRUD dans le container de CoreData
///
/// Définition de l'`EnvironmentValue` :
///   - var managedObjectContext: NSManagedObjectContext { get set }
///
/// Remarque :
///   - Exemple assez succinct car il faudrait faire beaucoup de setup pour CoreData

struct ManagedObjectContext: View {

  @Environment(\.managedObjectContext) private var managedObjectContext

  var body: some View {
    Button { saveContext() } label: {
      Text("Save me in CoreData")
        .font(.title2)
        .fontWeight(.bold)
        .foregroundColor(.black)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.pink.opacity(0.5))
        .clipShape(Capsule())
    }
  }

  private func saveContext() {
    do {
      try managedObjectContext.save()
    } catch {
      print(error.localizedDescription)
    }
  }
}

struct ManagedObject_Previews: PreviewProvider {
  static var previews: some View {
    ManagedObjectContext()
  }
}
