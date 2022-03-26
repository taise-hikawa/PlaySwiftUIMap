//
//  MapViewModel.swift
//  PlaySwiftUIMap
//
//  Created by 樋川大聖 on 2022/03/25.
//

import Foundation
import MapKit

class MapViewModel: ObservableObject {
    // show all of Japan by default
    @Published var region = MKCoordinateRegion(
        center: .init(latitude: 39, longitude: 139),
        latitudinalMeters: 1_700_000,
        longitudinalMeters: 1_700_000
    )

    let locationService = LocationService()
}
