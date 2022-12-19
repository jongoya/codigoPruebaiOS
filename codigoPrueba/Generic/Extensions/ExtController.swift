//
//  ExtController.swift
//  sae
//
//  Created by Mac Mini 5 on 6/6/22.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertMessage(mensaje: String) {
        let alert = UIAlertController(title: localizedString("alert_title"), message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: localizedString("alert_aceptar"), style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
