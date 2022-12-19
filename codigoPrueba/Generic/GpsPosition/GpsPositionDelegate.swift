//
//  GpsPositionDelegate.swift
//  sae
//
//  Created by Mac Mini 5 on 6/6/22.
//

import Foundation
import MapKit

protocol GpsPositionDelegate {
    func positionFound(position: CLLocationCoordinate2D)
}
