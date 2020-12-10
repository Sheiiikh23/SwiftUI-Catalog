//
//  ControlSize.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 24/07/2020.
//

import SwiftUI

/// controlSize permet de détecter la taille des boutons de l'utilisateur
/// Disponible sur : macOS
///
/// controlSize: ControlSize { get set }
///   - regular: par défaut
///   - small
///   - mini
///   - large
/// Possibilité de set cet environment variable avec le modifier .environment(\.controlSize, .option)

// MARK: - Importance pour l'accessibilité : moyenne - élevée
// MARK: - Utilisation : Permet de connaître la frame des contrôles en fonctions des presets de l'utilisateur et de les modifier si besoin
