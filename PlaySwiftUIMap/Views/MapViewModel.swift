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

    struct PinItem: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
        var text: String {
            """
            緯度: \(coordinate.latitude.description)
            経度: \(coordinate.longitude.description)
            """
        }
    }

    @Published var pins = [
        PinItem(coordinate: .init(latitude: 37, longitude: 139)),
        PinItem(coordinate: .init(latitude: 35.6, longitude: 138.3))
    ]

    @Published var selectedPin: PinItem?

    var presentingAlert: Bool {
        get { selectedPin != nil }
        set {
            selectedPin = nil
        }
    }

    let locationService = LocationService()
}
