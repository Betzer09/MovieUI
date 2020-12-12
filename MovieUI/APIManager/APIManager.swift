//
//  APIManager.swift
//  MovieUI
//
//  Created by Austin Betzer on 12/12/20.
//

import Foundation

class APIManager {
    static private var baseURL = "https://api.themoviedb.org/3/"
    
    
    
    public func loadDataWith<T: Decodable>(request: URLRequest, completion: @escaping(Result<T, Error>) -> () ) {
        URLSession.shared.dataTask(with: request, completionHandler: { (data, _, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data else {assert(true, "We have no data!") ;return}
            
            do {
                let jsonDecoder = JSONDecoder()
    //            jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                print("Beginning to decode type: \(T.self)")
                let decodedObject = try jsonDecoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedObject))
                }
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                
                DispatchQueue.main.async {
                    completion(.failure(context.underlyingError!))
                }
            } catch let DecodingError.valueNotFound(value, context)  {
                print("Value not found: '\(value)' message:", context.debugDescription)
                print("codingPath:", context.codingPath)
                DispatchQueue.main.async {
                    completion(.failure(context.underlyingError!))
                }
            } catch let DecodingError.keyNotFound(key, context)  {
                print("Key not found: '\(key)' message:", context.debugDescription)
                print("codingPath:", context.codingPath)
                DispatchQueue.main.async {
                    completion(.failure(context.underlyingError!))
                }
            } catch {
                print("[BackendManager]: Failed to decode object of type \(T.self)")
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
        }).resume()
    }
    
}


