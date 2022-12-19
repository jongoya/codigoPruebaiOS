//
//  CustomLabel.swift
//  sae
//
//  Created by Mac Mini 5 on 6/6/22.
//

import UIKit

class CustomLabel: UILabel {
    @IBInspectable var isBold: Bool = false {
        didSet {
            initLabel()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initLabel()
    }

    convenience init() {
        self.init(frame: CGRect.zero)
        initLabel()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initLabel()
    }

    private func initLabel() {
        if !isBold {
            font = UIFont(name: "Montserrat-SemiBold", size: font.pointSize)
        } else {
            font = UIFont(name: "Montserrat-Black", size: font.pointSize)
        }

        text = localizedString(text ?? "")
    }
    
    static func getFont(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Montserrat-Black", size: ofSize)
    }
    
    func setBold() {
        font = UIFont(name: "Montserrat-SemiBold", size: font.pointSize)
    }
}
