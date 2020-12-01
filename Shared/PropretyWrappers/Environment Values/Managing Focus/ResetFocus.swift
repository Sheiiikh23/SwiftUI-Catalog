//
//  ResetFocus.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 01/12/2020.
//

import SwiftUI

/// resetFocus permet de réévaluer le focus par défaut
/// Disponible sur : watchOS / tvOS
///
/// resetFocus: ResetFocusAction { get }
/// Unique fonction disponible :
///   • callasFunction(in: Namespace.ID) ––> doit s'utiliser avec un @Namespace
///

// MARK: - Importance pour l'accessibilité : très faible
// MARK: - Utilisation : Permet de reset le focus dans la current View avec un @Namespace
