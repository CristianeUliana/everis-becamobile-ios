//
//  Filme.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 26/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import UIKit

class Filme: NSObject {
    
    let id: Int
    @objc let titulo: String
    let caminhoPoster: String
    var detalhes: Detalhes
    
    init(_ id: Int, _ titulo: String, _ caminhoPoster: String) {
        self.id = id
        self.titulo = titulo
        self.caminhoPoster = caminhoPoster
        self.detalhes = Detalhes("", 0.0, "", "")
        }
}
