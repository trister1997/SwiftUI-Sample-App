//
//  NetworkManager.swift
//  Sample TV App
//
//  Created by Tyler Rister on 5/19/21.
//

import Combine
import Foundation

enum URLError: Error {
    case invalidUrl
}

class NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = "https://raw.githubusercontent.com/trister1997/sample-tv-json/master"
    private let jsonDecoder = JSONDecoder()
    
    init() {
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func getRequest<T: Codable>(urlExtension: String) -> AnyPublisher<T, Error> {
        let url = URL(string: "\(baseUrl)\(urlExtension)")
        guard let requestUrl = url else {
            return Fail(error: URLError.invalidUrl)
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: requestUrl)
            .map { $0.data }
            .decode(type: T.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
    
    func getTvShows() -> AnyPublisher<[TVShow], Error> {
        return getRequest(urlExtension: "/shows.json")
    }
    
    func getTvShow(id: Int) -> AnyPublisher<TVShowDetails, Error> {
        return getRequest(urlExtension: "/id/\(id).json")
    }
}
