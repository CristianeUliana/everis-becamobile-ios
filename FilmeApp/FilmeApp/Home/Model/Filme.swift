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
    let tituloOriginal: String
    let rating: Double
    let sinopse: String
    let caminhoPoster: String
    let caminhoImagemDetalhes: String
    
    
    init(_ id: Int, _ titulo: String, _ tituloOriginal: String, _ rating: Double, _ sinopse: String, _ caminhoPoster: String, _ caminhoImagemDetalhes: String) {
        self.id = id
        self.titulo = titulo
        self.tituloOriginal = tituloOriginal
        self.rating = rating
        self.sinopse = sinopse
        self.caminhoPoster = caminhoPoster
        self.caminhoImagemDetalhes = caminhoImagemDetalhes
    }
}
