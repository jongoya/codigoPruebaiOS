//
//  LineaTableViewCell.swift
//  sae
//
//  Created by Mac Mini 5 on 7/6/22.
//

import UIKit

class LineaTableViewCell: UITableViewCell {
    @IBOutlet weak var lineaColorView: UIView!
    @IBOutlet weak var lineaNumber: UILabel!
    @IBOutlet weak var lineaName: UILabel!
    
    var position: Int = 0
    var delegate: LineaCellDelegate!
    
    func setupCell(linea: Linea, position: Int, delegate: LineaCellDelegate) {
        selectionStyle = .none
        self.position = position
        self.delegate = delegate
        backgroundColor = UIColor(named: "background")
        lineaColorView.backgroundColor = UIColor(hex: linea.color)
        lineaNumber.text = linea.id
        lineaName.text = linea.nombre
    }
    
    @IBAction func didClickButton(_ sender: Any) {
        delegate.lineasCellPressed(position: position)
    }
}
