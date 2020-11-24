//
//  GridItemView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 29/06/2020.
//

import SwiftUI

/// GridItem compose les LazyH•V•Grid (indisociable)
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Les GridItem composent un Array qui compose le layout de la Grid
///
/// Un GridItem est composé :
///  • d'une size : adaptative, flexible, fixed
///  • un spacing (optionnel)
///  • un alignement (opionnel)
///
/// Voici les trois types de GridItems. Les sizes définit permettent de définir la height pour les HGrid et la width pour les VGrid
///  • adaptative(minimum:) (++) / adaptative(minimum:, maximum:) : met un nombre max de colonne / ligne pour remplir tout l'espace disponible (réactif en fonction de l'orientation du device)
///  • flexible() (+++) / flexible(minimum:) (++) / flexible(minimum:, maximium) : prend tout la width / height qui lui est disponible
///  • fixed(CGFloat) : prend la width / height indiqué
