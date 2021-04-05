//
//  DetalhesViewModel.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 05/04/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import Foundation


struct DetalhesViewModel {
    let title: String
    let originalTitle: String
    let backdropPath: String
    let overview: String
    let voteAverage: Double
   
    init(_ title: String, _ originalTitle: String, _ backdropPath: String, _ overview: String, _ voteAverage: Double) {
        self.title = title
        self.originalTitle = originalTitle
        self.backdropPath = backdropPath
        self.overview = overview
        self.voteAverage = voteAverage
    }
}




