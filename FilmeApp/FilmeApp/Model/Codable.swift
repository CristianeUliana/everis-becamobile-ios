//
//  Codable.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 31/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import Foundation

// CODABLE DA PRIMEIRA REQUISIÇÃO

// MARK: - Welcome
struct Welcome: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int
    
    
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
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



// CODABLE DA SEGUNDA REQUISIÇÃO



struct Details: Codable {
    let backdropPath: String
    let id: Int
    let originalTitle, overview: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case overview
        case voteAverage = "vote_average"
    }
}



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
//struct Details: Codable {
//    let adult: Bool?
//    let backdropPath: String
//    let belongsToCollection: BelongsToCollection?
//    let budget: Int?
//    let genres: [Genre]?
//    let homepage: String?
//    let id: Int?
//    let imdbID, originalLanguage, originalTitle, overview: String?
//    let popularity: Double?
//    let posterPath: String?
//    let productionCompanies: [ProductionCompany]?
//    let productionCountries: [ProductionCountry]?
//    let releaseDate: String?
//    let revenue, runtime: Int?
//    let spokenLanguages: [SpokenLanguage]?
//    let status, tagline, title: String?
//    let video: Bool?
//    let voteAverage: Double?
//    let voteCount: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case belongsToCollection = "belongs_to_collection"
//        case budget, genres, homepage, id
//        case imdbID = "imdb_id"
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview, popularity
//        case posterPath = "poster_path"
//        case productionCompanies = "production_companies"
//        case productionCountries = "production_countries"
//        case releaseDate = "release_date"
//        case revenue, runtime
//        case spokenLanguages = "spoken_languages"
//        case status, tagline, title, video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//}
//
//// MARK: - BelongsToCollection
//struct BelongsToCollection: Codable {
//    let id: Int
//    let name, posterPath, backdropPath: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case posterPath = "poster_path"
//        case backdropPath = "backdrop_path"
//    }
//}
//
//// MARK: - Genre
//struct Genre: Codable {
//    let id: Int
//    let name: String
//}
//
//// MARK: - ProductionCompany
//struct ProductionCompany: Codable {
//    let id: Int
//    let logoPath, name, originCountry: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case logoPath = "logo_path"
//        case name
//        case originCountry = "origin_country"
//    }
//}
//
//// MARK: - ProductionCountry
//struct ProductionCountry: Codable {
//    let iso3166_1, name: String
//
//    enum CodingKeys: String, CodingKey {
//        case iso3166_1 = "iso_3166_1"
//        case name
//    }
//}
//
//// MARK: - SpokenLanguage
//struct SpokenLanguage: Codable {
//    let englishName, iso639_1, name: String
//
//    enum CodingKeys: String, CodingKey {
//        case englishName = "english_name"
//        case iso639_1 = "iso_639_1"
//        case name
//    }
//}
//
//
//
//
