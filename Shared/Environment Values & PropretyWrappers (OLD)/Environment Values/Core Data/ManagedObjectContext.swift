//
//  ManagedObjectContext.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/07/2020.
//

import SwiftUI

/// managedObjectContext permet de faire des CRUD opérations dans container de CoreData
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// managedObjectContext : NSManagedObjectContext { get set }
/// Possibilité de set cet environment variable avec le modifier .environment(\.managedObjectContext, object)

// MARK: - Importance pour l'accessibilité : très faible – faible
// MARK: - Utilisation : Permet d'accéder et setter un managedObjectContext

struct ManagedObjectContext: View {

  @Environment(\.managedObjectContext) private var managedObjectContext

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
