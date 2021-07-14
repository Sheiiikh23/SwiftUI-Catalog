//
//  CommandGroup.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 23/11/2020.
//

import SwiftUI

/// CommandGroup permet de rajouter des actions à des menus déjà existant
/// Disponible sur : i•Pad•OS / macOS / Mac Catalyst
///
/// CommandGroup se trouve obligatoirement dans un commands modifier : cf CommandsModifier
/// Ces actions peuvent être ajouté avant (au top) ou après (au bottom) ou peuvent remplacer les actions déjà existantes
/// List des placements déjà présents :
///   • appInfo : placement pour les commandes fournissent des informations sur l'application, licence utilisateur ...
///   • appSettings : placement pour les commandes qui exposent les paramètres et les préférences de l'application
///   • appTermination : placement pour les commandes qui entraînent la fin de l'application
///   • appVisibility : placement pour les commandes qui contrôlent la visibilité des applications en cours d'exécution
///   • help : placement pour les commandes qui présentent une documentation et des infromations utiles à l'utilisateur
///   • importExport : placement pour les commandes relative à l'importation et à l'exportation de données utilisant des formats que l'application ne prend pas en charge en natif
///   • newItem : placement pour les commandes qui créent et ouvrent différents types de documents
///   • pasteboard : placement pour les applications qui interagissent avec le presse-papier et manipulent le contenu qui est selectionné dans la hiérarchie d'affichage de l'application
///   • printItem : placement pour les commandes liées à l'impression du contenu de l'application
///   • saveItem : placement pour les commandes qui enregistrent les documents ouverts et fement les fenêtres
///   • sidebar : placement pour les commandes qui contrôlent la barre latérale et les modes plein écran de l'app
///   • systemServices : placement pour les commandes qui exposent les services fournis par d'autres applications
///   • textEditing : placement pour les commandes qui manipulent et transforment les sélections de texte
///   • textFormatting : placement pour les commandes qui manipulent et transforment les styles appliqués aux sélection de texte
///   • toolbar : placement pour les commandes qui manipulent la barre d'outils
///   • undoRedo : placement pour les commandes qui contrôlent le gestionnaire d'annulation
///   • windowArrangement : placement pour les commandes qui arrangent toutes les fenêtres d'une application
///   • windowList : placement pour les commandes qui décrivent et révèlent les fenêtres ouvertes de l'application
///   • windowSize : placement pour les commandes qui contrôlent la taille de la fenêtre
///
/// Il existe des CommandGroup standards :
///   • SidebarCommands : commandes pour manipuler les barres latérales des fenêtres
///   • TextEditingCommands : commandes pour la recherche, l'édition et la transformation de sélections de texte
///   • TextFormattingCommands : commandes pour transformer les styles appliqués à des sélections de texte
///   • ToolbarCommands : commandes pour mannipules les barres d'outils des fenêtres
///   • EmptyCommands : groupe de commandes vide
///
/// Dans ces menu nous pouvons utilisé les View suivante :
///   • Button
///   • Picker
///   • Toggle
///   • Divider

// MARK: - Utilisation : Ajouter des commandes / groupes de commandes (prebuild) à des menus déjà existants

struct CommandGroupView: App {

  var body: some Scene {
    WindowGroup {
      LabelView()
    }
    .commands {

      // Ajout d'une actions avant le group pasteboard
      CommandGroup(before: .pasteboard) {
        Button { } label: { Text("See the clipboard") }
      }

      // Ajout d'une action après le group textEditing
      CommandGroup(after: .textEditing) {
        Button { } label: { Text("Custom textEditing action") }
      }

      // Remplacement du group appVisibility par une unique action
      CommandGroup(replacing: .appVisibility) {
        Button { } label: { Text("Regrouper toutes les fenêtres") }
      }

      CommandGroup(before: .newItem) {
        Toggle("Toggle me", isOn: .constant(true))
      }

      CommandGroup(after: .newItem) {
        Picker(selection: .constant(0), label: Text("Choose an option")) {
          Text("Option 1")
            .tag(0)
          Text("Option 2")
            .tag(1)
        }
      }
      TextFormattingCommands()
    }
  }
}
