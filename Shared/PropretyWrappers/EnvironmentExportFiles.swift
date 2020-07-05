////
////  EnvironmentExportFiles.swift
////  SwiftUI 2.0
////
////  Created by Lucas Abijmil on 05/07/2020.
////
//
//import SwiftUI
//
///// Export file qui permet à l'utilisateur de sauvegarder des fichiers depuis notre application
///// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
/////
///// Il faut que les fichiers soient déplaçable sinon cela va toujours échouer
///// Je fake un fichier pour montrer la fonction
//
//struct EnvironmentExportFiles: View {
//
//  @Environment(\.exportFiles) var exportAction
//
//  var body: some View {
//    Button {
//
//      /// Force unwrapp c'est pas bien !!!!!
//      let url = Bundle.main.url(forResource: "README", withExtension: "md")!
//
//      // Il existe trois  type de résultat pour l'export d'un fichier
//      exportAction(moving: url) { result in
//        switch result {
//
//        /// success
//        case .success(let url): print("Succes \(url)")
//
//        /// failure
//        case .failure(let error): print("Error \(error.localizedDescription)")
//
//        /// cancel by the user
//        case .none: print("Cancel")
//        }
//      }
//    } label: {
//      Text("Exporter vos fichiers")
//    }
//  }
//}
//
//struct EnvironmentExportFile_Previews: PreviewProvider {
//  static var previews: some View {
//    EnvironmentExportFiles()
//  }
//}


#warning("refacto")
