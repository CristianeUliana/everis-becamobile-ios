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
    let titulo: String
    let rating: Double
    let sinopse: String
    let caminhoPoster: String
    
    
    init(_ id: Int, _ titulo: String, _ rating: Double, _ sinopse: String, _ caminhoPoster: String) {
        self.id = id
        self.titulo = titulo
        self.rating = rating
        self.sinopse = sinopse
        self.caminhoPoster = caminhoPoster
    }
}
