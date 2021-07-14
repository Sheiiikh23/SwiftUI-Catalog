//
//  ScrollViewReader & ScrollViewProxy.swift
//  iOS
//
//  Created by Lucas Abijmil on 12/11/2020.
//


// MARK: - ScrollViewReader & ScrollViewProxy : CF ScrollToModifier (indisociable)
///  - S'apparente un peu au delegate du Scroll avec UIKit
///  - Fait passer une value locale, ScrollViewProxy similaire au GeometryReaderProxy
///  - Permet de connaître la position du scroll
///  - Permet de pouvoir scroller automatiquement vers un endroit particulier grâce à la fonction scrollTo via le ScrollViewProxy
