//
//  GetLineasDelegate.swift
//  sae
//
//  Created by Mac Mini 5 on 7/6/22.
//

import Foundation

protocol GetLineasDelegate {
    func successGettingLineas(lineas: [Linea])
    func errorGettingLineas()
}
