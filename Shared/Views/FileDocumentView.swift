////
////  FileDocumentView.swift
////  SwiftUI 2.0
////
////  Created by Lucas Abijmil on 04/07/2020.
////
//
//import SwiftUI
//import UniformTypeIdentifiers
//
///// Apparition de la création / modification / sauvegarde de fichier de tout type
///// Disponible sur: i•Pad•OS / macOS / Mac Catalyst
/////
///// 1) Définir le type de fichier(s) avec le(s)quel(s) on va pouvoir "travailler"
///// 2) Créer la UI pour éditer le fichier
///// 3) Dans le fichier @main : remplacer la windowGroup pour DocumentGroup pour le passé à notre View ––> uniquement si toute notre app fera de l'édition de document
///// cf ici: https://youtu.be/-h8pk2pe7Xo?t=2540
//
//// MARK: - Utilisation : création, modification et sauvegarde d'un fichier (en utilisant l'app Fichiers)
//
///// Étape 1 : création d'une structure qui va gérer le type, l'ouvertude, l'edit et la sauvegarde d'un document
//struct TextFile: FileDocument {
//
//  /// Définition des types de fichiers qui sont acceptés (ils en existent par défaut une multitude)
//  static var readableContentTypes: [UTType] = [.plainText]
//
//  /// Initialisation du texte qui est vide par défaut
//  var text = ""
//
//  /// Init classique
//  init(text: String = "") {
//    self.text = text
//  }
//
//  /// Init requis: permet de récupérer les data du fichier pour les passer dans notre variable View (ici la String)
//  init(fileWrapper: FileWrapper, contentType: UTType) throws {
//    /// Si on arrive à rentrer dans le fichier et à lire ce qu'il y a dedans
//    if let data = fileWrapper.regularFileContents {
//      // Alors text = data decodé en UTF8
//      text = String(decoding: data, as: UTF8.self)
//    }
//  }
//
//  /// Fonction qui gére la sauvegarde du fichier
//  func write(to fileWrapper: inout FileWrapper, contentType: UTType) throws {
//    /// On converti notre data en temps que Data "multiplateforme"
//    let data = Data(text.utf8)
//    fileWrapper = FileWrapper(regularFileWithContents: data)
//  }
//}
//
///// Étape 2 : créer la UI pour éditer le fichier
//struct FileDocumentView: View {
//
//  /// Binding car le fichier ne nous appartient pas et qu'il est externe
//  @Binding var document: TextFile
//
//  var body: some View {
//    /// Utilisation de la nouvel View TextEditor qui est un TextField multiLine
//    TextEditor(text: $document.text)
//  }
//}
//
//struct FileDocumentView_Previews: PreviewProvider {
//  static var previews: some View {
//    FileDocumentView(document: .constant(TextFile()))
//  }
//}


#warning("refacto")
