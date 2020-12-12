//
//  APIManager.swift
//  MovieUI
//
//  Created by Austin Betzer on 12/12/20.
//

import Foundation

class APIManager {
    static private let baseURL = "https://api.themoviedb.org/3/"
    static private let region = "US"
    
    private var apiKey: String = ""
    
    static let shared = APIManager()
    
    public func loadDataWith<T: Decodable>(url: URL, completion: @escaping(Result<T, Error>) -> () ) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
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
    
    /**
     Builds the default components for a route
     
     parameter path: The path to the route, be sure to start with a forward "/"
     */
    
    public func buildDefaultComponents(path: String) -> URLComponents {
        var components = URLComponents(string: APIManager.baseURL + path)!
        let apiItem = URLQueryItem(name: "api_key", value: apiKey)
        let regionItem = URLQueryItem(name: "region", value: APIManager.region)
        components.queryItems = [apiItem, regionItem]
        return components
        
    }
    
    public func loadAPIKey() {
        guard let url = Bundle.main.url(forResource: "Keys", withExtension: "plist"),
           let xml = try? Data(contentsOf: url) ,
           let data = try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil) as? [String: Any],
           let apiKey = data["Movie_DB_Key"] as? String else {
            assert(true, "Unable to load API Key!")
            return
        }
        
        self.apiKey = apiKey
    }
    
}


