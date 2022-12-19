//
//  GpsPosition.swift
//  sae
//
//  Created by Mac Mini 5 on 6/6/22.
//

import Foundation
import MapKit

class GpsPosition: NSObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    var gpsDelegate: GpsPositionDelegate!
    
    override init() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func posicionActual(delegate: GpsPositionDelegate) {
        gpsDelegate = delegate
        locationManager.distanceFilter = kCLDistanceFilterNone
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func ultimaPosicion() -> CLLocationCoordinate2D? {
        return CommonFunctions.getPosition()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        gpsDelegate.positionFound(position: locations.first!.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("")
    }
}
