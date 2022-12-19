//
//  ParadasTableViewCell.swift
//  sae
//
//  Created by Mac Mini 5 on 6/6/22.
//

import UIKit

class ParadasTableViewCell: UITableViewCell {
    @IBOutlet weak var nombreParada: UILabel!
    @IBOutlet weak var correspondenciasView: UIView!
    
    func setupCell(parada: String) {
        backgroundColor = .white
        selectionStyle = .none
    }
    
    private func setupCorrespondencias(correspondencias: [String]) {
        for view in correspondenciasView.subviews {
            view.removeFromSuperview()
        }
        
        var lastView: UIView!
        for correspondencia: String in correspondencias {
            let corresView = createCorrespondenciaView()
            correspondenciasView.addSubview(corresView)
            corresView.topAnchor.constraint(equalTo: correspondenciasView.topAnchor).isActive = true
            corresView.bottomAnchor.constraint(equalTo: correspondenciasView.bottomAnchor).isActive = true
            corresView.leadingAnchor.constraint(equalTo: lastView != nil ? lastView.trailingAnchor : correspondenciasView.leadingAnchor, constant: lastView != nil ? 2: 0).isActive = true
            corresView.widthAnchor.constraint(equalToConstant: 35).isActive = true
            addCorrespondenciaLabel(parentView: corresView, correspondencia: correspondencia)
            lastView = corresView
        }
    }
    
    private func createCorrespondenciaView() -> UIView {
        let corresView: UIView = UIView(frame: .zero)
        corresView.translatesAutoresizingMaskIntoConstraints = false
        corresView.backgroundColor = .blue
        
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
