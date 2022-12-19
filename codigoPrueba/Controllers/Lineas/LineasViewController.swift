//
//  LineasViewController.swift
//  sae
//
//  Created by Mac Mini 5 on 3/6/22.
//

import UIKit

class LineasViewController: UIViewController {

    @IBOutlet weak var lineasTableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var navigationBar: NavigationBar!
    
    var lineas: [Linea] = []
    var lineasFiltradas: [Linea] = []
    var flujoFavoritos: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        customizeFields()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getLineas()
    }
    
    private func setNavigationBar() {
        navigationBar.setNavigationDelegate(delegate: self)
        if !flujoFavoritos {
            navigationBar.hideBackButton()
        }
        navigationBar.hideInformationButton()
    }
    
    private func customizeFields() {
        searchField.attributedPlaceholder =
        NSAttributedString(string: localizedString("lineas_buscar"), attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        searchField.textColor = .black
        searchField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        lineasTableView.separatorStyle = .none
        lineasTableView.backgroundColor = UIColor(named: "background")
    }
    
    private func getLineas() {
        RESTServices().getLineas(llamada: "lineas", delegate: self)
    }
    
    private func filtrarLineas() {
        if searchField.text!.isEmpty {
            showAlertMessage(mensaje: "El campo busqueda debe contener un texto para realizar la busqueda")
            return
        }
        
        lineasFiltradas.removeAll()
        for linea: Linea in lineas {
            if linea.nombre.lowercased().contains(searchField.text!.lowercased()) {
                lineasFiltradas.append(linea)
            }
        }
        
        lineasTableView.reloadData()
    }
    
    @IBAction func didClickSearchButton(_ sender: Any) {
        filtrarLineas()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if searchField.text!.isEmpty {
            self.lineasFiltradas = self.lineas
            self.lineasTableView.reloadData()
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension LineasViewController: NavigationBarDelegate {
    func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    func bellButtonPressed() {
    }
    
    func informationButtonPressed() {}
}

extension LineasViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lineasFiltradas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda: LineaTableViewCell = tableView.dequeueReusableCell(withIdentifier: "lineaCell") as? LineaTableViewCell ?? LineaTableViewCell(style: .default, reuseIdentifier: "lineaCell")
        celda.setupCell(linea: lineasFiltradas[indexPath.row], position: indexPath.row, delegate: self)
        return celda
    }
}

extension LineasViewController: GetLineasDelegate {
    func successGettingLineas(lineas: [Linea]) {
        DispatchQueue.main.async {
            self.lineas = lineas
            self.lineasFiltradas = lineas
            self.lineasTableView.reloadData()
        }
    }
    
    func errorGettingLineas() {
        DispatchQueue.main.async {
            self.showAlertMessage(mensaje: localizedString("lineas_error"))
        }
    }
}

extension LineasViewController: LineaCellDelegate {
    func lineasCellPressed(position: Int) {
    }
}
