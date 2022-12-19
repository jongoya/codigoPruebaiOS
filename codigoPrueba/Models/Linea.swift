//
//  Linea.swift
//  sae
//
//  Created by Mac Mini 5 on 7/6/22.
//

import Foundation

class Linea: Codable {
    var id: String = ""
    var nombre: String = ""
    var color: String = ""
    var fontColor: String = ""
    var tipo: String = ""
    var pdfHorarios: String = ""
    var pdf: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nombre = "name"
        case color = "color"
        case fontColor = "fontcolor"
        case tipo = "tipo"
        case pdfHorarios = "pdf_horarios"
        case pdf = "pdf"
    }
}
