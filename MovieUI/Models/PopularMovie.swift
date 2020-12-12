//
//  PopularMovie.swift
//  MovieUI
//
//  Created by Austin Betzer on 12/12/20.
//

import Foundation

struct PopularMovie: Codable, Identifiable {
    let id: Int
    let originalTitle: String
    let overview: String
    let rating: Int
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview
        case rating = "vote_average"
        case posterPath = "poster_path"
    }
}
