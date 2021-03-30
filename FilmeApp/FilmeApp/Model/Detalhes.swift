//
//  Detalhes.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 29/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import UIKit

class Detalhes: NSObject {

    var tituloOriginal: String
    var rating: Double
    var sinopse: String
    var caminhoImagem: String
    
    
    init (_ tituloOriginal: String, _ rating: Double, _ sinopse: String, _ caminhoImagem: String) {
        self.tituloOriginal = tituloOriginal
        self.rating = rating
        self.sinopse = sinopse
        self.caminhoImagem = caminhoImagem
    }
}
