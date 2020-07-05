//
//  MapKitView.swift
//  SwiftUI 2.0
//
//  Created by Lucas Abijmil on 01/07/2020.
//

import MapKit
import SwiftUI

/// Apparition de Map qui permet d'afficher une map
/// Disponible sur : i•Pad•OS / watchOS / tvOS / macOS / Mac Catalyst
///
/// Définir une MKCoordinationRegion (souvent en @State var ou similaire) car la map a besoin d'un *Binding*
/// Il existe plein de constructeurs différent mais j'ai choisis le plus basique car le plus courant

// MARK: - Utilisation : Pour insérer des cartes utilisant la géolocalisation

struct MapView: View {

@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8534,
                                                                              longitude: 2.3488),
                                               span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

  var body: some View {
    Map(coordinateRegion: $region)
      .edgesIgnoringSafeArea(.all)
  }
}

struct MapKitView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
