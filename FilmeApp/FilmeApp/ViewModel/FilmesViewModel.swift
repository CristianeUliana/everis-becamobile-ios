//
//  FilmesViewModel.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 05/04/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import Foundation

struct FilmesViewModel: Codable {
  
    let id: Int
    let posterPath: String
    let title: String
    
    init(_ id: Int, _ posterPath: String, _ title: String) {
        self.title = title
        self.id = id
        self.posterPath = posterPath
    }
}








