//
//  TVShowDetails.swift
//  Sample TV App
//
//  Created by Tyler Rister on 5/19/21.
//

import Foundation

struct TVShowDetails: Codable {
    let id: Int
    let title: String
    let rating: Double
    let coverPhoto: String
    let year: Int
    let seasons: Int
    let imdbLink: String
    let rated: String
    let genres: [String]
    let description: String
}
