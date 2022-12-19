//
//  FavoritosTableViewCell.swift
//  sae
//
//  Created by Mac Mini 5 on 13/6/22.
//

import UIKit

class FavoritosTableViewCell: UITableViewCell {
    @IBOutlet weak var nombreLabel: CustomLabel!
    @IBOutlet weak var correspondenciasView: UIView!
    
    func setupCell() {
        selectionStyle = .none
        nombreLabel.textColor = .black
    }
    
    private func setupCorrespondencias(correspondencias: [String], color: String) {
        for view in correspondenciasView.subviews {
            view.removeFromSuperview()
        }
        
        var lastView: UIView!
        for correspondencia: String in correspondencias {
            let corresView = createCorrespondenciaView(color: color)
            correspondenciasView.addSubview(corresView)
            corresView.topAnchor.constraint(equalTo: correspondenciasView.topAnchor).isActive = true
            corresView.bottomAnchor.constraint(equalTo: correspondenciasView.bottomAnchor).isActive = true
            corresView.leadingAnchor.constraint(equalTo: lastView != nil ? lastView.trailingAnchor : correspondenciasView.leadingAnchor, constant: lastView != nil ? 2: 0).isActive = true
            corresView.widthAnchor.constraint(equalToConstant: 35).isActive = true
            addCorrespondenciaLabel(parentView: corresView, correspondencia: correspondencia)
            lastView = corresView
        }
    }
    
    private func createCorrespondenciaView(color: String) -> UIView {
        let corresView: UIView = UIView(frame: .zero)
        corresView.translatesAutoresizingMaskIntoConstraints = false
        corresView.backgroundColor = UIColor(hex: color)
        
        return corresView
    }
    
    private func addCorrespondenciaLabel(parentView: UIView, correspondencia: String) {
        let label: UILabel = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = correspondencia
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        parentView.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
    }
}
