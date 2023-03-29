//
//  NetworkManager.swift
//  Movies and series
//
//  Created by Русинов Евгений on 29.03.2023.
//


import UIKit


class NetworkManager {
    func request(urlString: String, completion: @escaping (Swift.Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                if let error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }.resume()
    }
}
