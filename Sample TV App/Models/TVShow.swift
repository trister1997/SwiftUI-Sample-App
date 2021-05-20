//
//  TVShow.swift
//  Sample TV App
//
//  Created by Tyler Rister on 5/19/21.
//

import Foundation

struct TVShow: Codable, Hashable {
    let id: Int
    let title: String
    let rating: Double
    let coverPhoto: String
    let year: Int
    let seasons: Int
    let imdbLink: String
}
