//
//  ViewController.swift
//  sae
//
//  Created by Mac Mini 5 on 3/6/22.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.performSegue(withIdentifier: "mainTabSegue", sender: nil)
        }
    }
}
