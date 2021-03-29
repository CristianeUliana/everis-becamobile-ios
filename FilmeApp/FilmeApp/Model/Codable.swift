//
//  codable.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 26/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import Foundation

struct TopLevel {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int
}

struct Result {
    let adult: Bool?
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: OriginalLanguage
    let originalTitle: String?
    let overview, posterPath: String
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int
    let popularity: Double
    let mediaType: MediaType
    let originCountry: [String]?
    let firstAirDate, name, originalName: String?
}

enum MediaType  {
    case movie
    case tv
}

enum OriginalLanguage {
    case en
    case es
    case ja
}

