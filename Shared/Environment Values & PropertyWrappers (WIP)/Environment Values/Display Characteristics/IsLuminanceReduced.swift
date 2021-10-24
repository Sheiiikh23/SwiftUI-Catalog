//
//  Copyright (c) 2021 Lucas Abijmil. All rights reserved.
//

import SwiftUI

/// Plateforme : watchOS 8.0
/// Description : Un booléen qui indique si l'affichage nécessite une luminance réduit ou non
///
/// Définition de l'`EnvironmentValue` :
///   - var isLuminanceReduced: Bool { get set }
///
/// Remarques :
///   - isLuminanceReduced = true 👉 utilisateur baisse son poignet mais l'écran reste allumé
///   - Permet de préserver le contraste et la lisibilité tout en satisfaisant l'exigence de réduction de la luminosité
