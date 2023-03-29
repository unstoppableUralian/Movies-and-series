//
//  NetworkDataFetcher.swift
//  Movies and series
//
//  Created by Русинов Евгений on 29.03.2023.
//

import Foundation


class NetworkDataFetcher {
    
    private let networkManager = NetworkManager()
    
    func fetchMovies(urlString: String, completion: @escaping (Movie?) -> Void) {
        networkManager.request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let movies = try JSONDecoder().decode(Movie.self, from: data)
                    completion(movies)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(nil)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}
