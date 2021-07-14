//
//  ControlActiveState.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 25/07/2020.
//

import SwiftUI

/// controlActiveState permet de détecter l'état actif des contrôles (buttons) dans la View
/// Disponible sur : macOS
///
/// controlActiveState: ControlActiveState { get set }
///   - key: par défaut
///   - active
///   - inactive
/// Possibilité de set cet environment variable avec le modifier .environment(\.controlActiveState, .option)

// MARK: - Importance pour l'accessibilité : moyenne - élevée
// MARK: - Utilisation : Permet de connaître / setter l'état des contrôles de la View
