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
    var titulo: String
    var tituloOriginal: String
    var rating: Double
    var sinopse: String
    let caminhoPoster: String
    var caminhoImagem: String
    
    
    init(_ id: Int, _ titulo: String = "", _ tituloOriginal: String = "", _ rating: Double = 0.0, _ sinopse: String = "", _ caminhoPoster: String, _ caminhoImagem: String = "") {
        self.id = id
        self.titulo = titulo
        self.tituloOriginal = tituloOriginal
        self.rating = rating
        self.sinopse = sinopse
        self.caminhoPoster = caminhoPoster
        self.caminhoImagem = caminhoImagem
    }
}
