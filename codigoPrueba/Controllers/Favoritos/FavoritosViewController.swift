//
//  FavoritosViewController.swift
//  sae
//
//  Created by Mac Mini 5 on 3/6/22.
//

import UIKit

class FavoritosViewController: UIViewController {
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var noHayFavoritosView: UIView!
    @IBOutlet weak var noFavoritosLabel: CustomLabel!
    @IBOutlet weak var favoritosTableView: UITableView!
    
    var paradas: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkParadas()
    }
    
    private func setNavigationBar() {
        navigationBar.setNavigationDelegate(delegate: self)
        navigationBar.hideBackButton()
        navigationBar.hideInformationButton()
    }
    
    private func setFields() {
        noFavoritosLabel.textColor = .black
        favoritosTableView.separatorStyle = .none
    }
    
    private func checkParadas() {
        noHayFavoritosView.isHidden = paradas.count == 0 ? false : true
        favoritosTableView.isHidden = paradas.count == 0 ? true : false
        favoritosTableView.reloadData()
    }
    
    @IBAction func didClickNoFavoritosView(_ sender: Any) {
    }
}

extension FavoritosViewController: NavigationBarDelegate {
    func backButtonPressed() {}
    
    func bellButtonPressed() {
    }
    
    func informationButtonPressed() {}
}

extension FavoritosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paradas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda: FavoritosTableViewCell = tableView.dequeueReusableCell(withIdentifier: "favoritosCell") as? FavoritosTableViewCell ?? FavoritosTableViewCell(style: .default, reuseIdentifier: "favoritosCell")
        celda.setupCell()
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
