//
//  LocationService.swift
//  PlaySwiftUIMap
//
//  Created by 樋川大聖 on 2022/03/26.
//

import Foundation
import CoreLocation

class LocationService: NSObject {
    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // TODO: error handler
    }
}
