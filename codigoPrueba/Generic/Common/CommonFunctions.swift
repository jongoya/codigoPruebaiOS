//
//  CommonFunctions.swift
//  sae
//
//  Created by Mac Mini 5 on 6/6/22.
//

import Foundation
import MapKit

class CommonFunctions {
    static func savePosition(coordinate: CLLocationCoordinate2D) {
        let defaults = UserDefaults.standard
        defaults.setValue(Double(coordinate.latitude), forKey: "latitud")
        defaults.setValue(Double(coordinate.longitude), forKey: "longitud")
    }
    
    static func getPosition() -> CLLocationCoordinate2D {
        let defaults = UserDefaults.standard
        let latitud: Double = defaults.double(forKey: "latitud")
        let longitud: Double = defaults.double(forKey: "longitud")
        return CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
    }
}
