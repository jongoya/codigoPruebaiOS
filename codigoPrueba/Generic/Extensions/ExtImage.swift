//
//  ExtImage.swift
//  sae
//
//  Created by Mac Mini 5 on 8/6/22.
//

import Foundation
import UIKit

extension UIImage {
    func colorized(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context!.setBlendMode(.multiply)
        context!.draw(cgImage!, in: CGRect(origin: .zero, size: rect.size))
        context!.clip(to: rect, mask: self.cgImage!)
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let colorizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return colorizedImage!
    }
}
