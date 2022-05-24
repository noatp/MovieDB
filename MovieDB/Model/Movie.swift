//
//  Movie.swift
//  MovieDB
//
//  Created by Toan Pham on 5/23/22.
//

import Foundation

// MARK: - FetchResult
struct MoviePage: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


// MARK: - Movie

//need thumbnail, title, popularity score, release year
//if available: overview, run time, link to homepace
struct Movie: Codable {
    let backdropPath: String
    let id: Int
    let overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let runtime: Int?
    let homepage: String?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case runtime
        case homepage
    }
}

