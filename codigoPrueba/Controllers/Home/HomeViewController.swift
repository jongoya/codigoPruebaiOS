//
//  HomeViewController.swift
//  sae
//
//  Created by Mac Mini 5 on 3/6/22.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var paradasView: UIView!
    @IBOutlet weak var paradasViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var flechaImage: UIImageView!
    @IBOutlet weak var paradasTableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    var paradas: [String] = []
    var paradasExtended: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        customizeFields()
        Constants.gpsPosition.posicionActual(delegate: self)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
    }
    
    private func setNavigationBar() {
        navigationBar.setNavigationDelegate(delegate: self)
        navigationBar.hideBackButton()
        navigationBar.hideInformationButton()
    }
    
    private func customizeFields() {
        paradasView.layer.cornerRadius = 10
        paradasTableView.backgroundColor = .clear
        paradasTableView.separatorStyle = .none
    }
    
    private func animateLayout(constantValue: Int) {
        self.paradasViewBottomConstraint.constant = CGFloat(constantValue)
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func setMapDetails(myLocation: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: myLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 10000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
    
    @IBAction func didClickParadasArrow(_ sender: Any) {
        if paradasExtended {
            flechaImage.image = UIImage(named: "flecha_arriba")
            animateLayout(constantValue: -120)
        } else {
            flechaImage.image = UIImage(named: "flecha_abajo")
            animateLayout(constantValue: -15)
        }
        
        paradasExtended = !paradasExtended
    }
}

extension HomeViewController: NavigationBarDelegate {
    func backButtonPressed() {}
    
    func bellButtonPressed() {
    }
    
    func informationButtonPressed() {}
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paradas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda: ParadasTableViewCell = tableView.dequeueReusableCell(withIdentifier: "paradaCell") as? ParadasTableViewCell ?? ParadasTableViewCell(style: .default, reuseIdentifier: "paradaCell")
        celda.setupCell(parada: paradas[indexPath.row])
        return celda
    }
}

extension HomeViewController: GpsPositionDelegate {
    func positionFound(position: CLLocationCoordinate2D) {
        setMapDetails(myLocation: position)
    }
}

extension HomeViewController: GetParadasCercanasDelegate {
    func succesGettingParadas(paradas: [String]) {
        DispatchQueue.main.async {
            self.paradas.append(contentsOf: paradas)
            self.paradasTableView.reloadData()
            if paradas.count > 0 {
                self.animateLayout(constantValue: -120)
            }
        }
    }
    
    func errorGettingParadas() {
        DispatchQueue.main.async {
            self.showAlertMessage(mensaje: localizedString("Error recogiendo las paradas cercanas, inténtelo de nuevo"))
        }
    }
}
