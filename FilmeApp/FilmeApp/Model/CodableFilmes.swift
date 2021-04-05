//
//  CodableFilmes.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 05/04/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import Foundation

struct Welcome: Codable {
  
    let results: [Result]
    
    
    enum CodingKeys: String, CodingKey {
        case results

    }
}

struct Result: Codable {
   
    let id: Int
   
    let posterPath: String
    let title: String
    
    
    enum CodingKeys: String, CodingKey {
      
        case id
      
        case posterPath = "poster_path"
      
        case title
  
    }
}


//
//
//struct Welcome: Codable {
//    let page: Int
//    let results: [Result]
//    let totalPages, totalResults: Int
//
//
//
//    enum CodingKeys: String, CodingKey {
//        case page, results
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//    }
//}
//
//struct Result: Codable {
//    let adult: Bool
//    let backdropPath: String
//    let genreIDS: [Int]
//    let id: Int
//    let originalLanguage: OriginalLanguage
//    let originalTitle, overview, posterPath, releaseDate: String
//    let title: String
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//    let popularity: Double
//    let mediaType: MediaType
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case genreIDS = "genre_ids"
//        case id
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview
//        case posterPath = "poster_path"
//        case releaseDate = "release_date"
//        case title, video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//        case popularity
//        case mediaType = "media_type"
//    }
//}
//
//enum MediaType: String, Codable {
//    case movie = "movie"
//}
//
//enum OriginalLanguage: String, Codable {
//    case en = "en"
//    case ru = "ru"
//}
//
//
//
//
