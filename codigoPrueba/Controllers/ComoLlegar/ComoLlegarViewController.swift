//
//  ComoLlegarViewController.swift
//  sae
//
//  Created by Mac Mini 5 on 3/6/22.
//

import UIKit

class ComoLlegarViewController: UIViewController {

    @IBOutlet weak var navigationBar: NavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        navigationBar.setNavigationDelegate(delegate: self)
        navigationBar.hideBackButton()
        navigationBar.hideInformationButton()
    }
}

extension ComoLlegarViewController: NavigationBarDelegate {
    func backButtonPressed() {}
    
    func bellButtonPressed() {
        //TODO
    }
    
    func informationButtonPressed() {}
}
