//
//  Movie.swift
//  Movies and series
//
//  Created by Русинов Евгений on 29.03.2023.
//

import Foundation

struct Movie: Decodable {
    let searchType: String
    let expression: String
    let results: [Result]
    let errorMessage: String
}


struct Result: Decodable {
    let id: String
    let resultType: String
    let image: String
    let title: String
    let description: String
}
