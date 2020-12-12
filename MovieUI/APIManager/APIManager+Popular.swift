//
//  APIManager+Popular.swift
//  MovieUI
//
//  Created by Austin Betzer on 12/12/20.
//

import Foundation

/**
 Handles fetching popular movies
 */
extension APIManager {

    
    /**
     Loads a popular movie
     
     https://api.themoviedb.org/3/movie/popular?api_key=86165ce6aa5016096e5167b7e279ecae&language=en-US&page=1&region=US
     */
    public func loadPopularMovie(page: Int, completion: @escaping (Result<PopularMovie, Error>) -> ()) {
        var defaultComponents = buildDefaultComponents(path: "/movie/popular")
        
        let pageItem = URLQueryItem(name: "page", value: "\(page)")
        let languageItem = URLQueryItem(name: "language", value: "en-US")
        defaultComponents.queryItems?.append(contentsOf: [pageItem, languageItem])
        
        guard let url = defaultComponents.url else {return}
        APIManager.shared.loadDataWith(url: url, completion: completion)
    }
    
}
