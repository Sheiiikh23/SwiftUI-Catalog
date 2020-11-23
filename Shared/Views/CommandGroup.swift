//
//  CommandGroup.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 23/11/2020.
//

import Foundation

///   • EmptyCommands ––> sert à rien 😅:
///     - i•Pad•OS / macOS / Mac Catalyst / tvOS
///   • CommandGroup(before: CommandGroupPlacement) | CommandGroup(after: CommandGroupPlacement) | CommandGroup(replacing: CommandGRoupPlacement)
///     - macOS / Mac Catalyst : forme de collections d'éléments dans un menu ???
///     - i•Pad•OS / tvOS : "commandes clés" pour chaque commande ayant un keyboardShortcut
///   • CommandMenu("String"):
///     - macOS / Mac Catalyst : rajoute un menu déroulant entre View et Window dans l'ordre de déclaration
///     - i•Pad•OS / tvOS : "commandes clés" pour chaque commande ayant un keyboardShortcut
///   • SidebarCommands:
///     - macOS / Mac Catalyst : ensemble de commandes pour manipuler les barres latérales des fenêtres
///     - i•Pad•OS : ???
///   • TextEditingCommands:
///     - macOS / Mac Catalyst : ensemble de commandes pour la recherche, l'édition et la transformation d'un texte selectionné
///     - i•Pad•OS : ??
///   • TextFormattingCommands:
///     - macOS / Mac Catalyst : ensemble de commandes pour transformer les styles appliqués à des textes selectionnés
///     - i•Pad•OS : ??
///   • ToolbarCommands:
///     - macOS / Mac Catalyst : ensemble de commandes pour manipuler les barres d'outils des fenêtres
///     - i•Pad•OS : ??
///
///   CommandGroupPlacement cf: CommandGroupPlacementModfier

//
