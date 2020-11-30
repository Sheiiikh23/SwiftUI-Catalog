//
//  ManagedObject.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/07/2020.
//

import SwiftUI

/// managedObjectContext permet de faire des CRUD opérations dans container de CoreData
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst

// @Environment(\.managedObjectContext) : NSManagedObjectContext { get set } 

// MARK: - Importance pour l'accessibilité : élevée - très élevée
// MARK: - Utilisation : Permet de l

struct ManagedObject: View {

  @Environment(\.managedObjectContext) private var managedObject

  var body: some View {
    Button { saveContext() } label: {
      Text("Sauvegarder moi dans CoreData")
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
      try managedObject.save()
    } catch {
      print(error.localizedDescription)
    }
  }
}

struct ManagedObject_Previews: PreviewProvider {
  static var previews: some View {
    ManagedObject()
  }
}
