//
//  Detalhes.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 29/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import UIKit

class Detalhes: NSObject {

    
    var titulo: String
    var tituloOriginal: String
    var rating: Double
    var sinopse: String
    var caminhoImagem: String
    
    
    init (_ titulo: String, _ tituloOriginal: String, _ rating: Double, _ sinopse: String, _ caminhoImagem: String) {
        self.titulo = titulo
        self.tituloOriginal = tituloOriginal
        self.rating = rating
        self.sinopse = sinopse
        self.caminhoImagem = caminhoImagem
    }
    
    
    
    
    
//    let id: Int
//    let titulo: String
//    let tituloOriginal: String
//    let rating: Double
//    let sinopse: String
//    let caminhoImagem: String
//
//
//    init(_ id: Int, _ titulo: String, _ tituloOriginal: String, _ rating: Double, _ sinopse: String, _ caminhoImagem: String) {
//        self.id = id
//        self.titulo = titulo
//        self.tituloOriginal = tituloOriginal
//        self.rating = rating
//        self.sinopse = sinopse
//        self.caminhoImagem = caminhoImagem
//    }

}
