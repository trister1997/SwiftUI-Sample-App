//
//  Strings.swift
//  Sample TV App
//
//  Created by Tyler Rister on 5/19/21.
//

import Foundation

enum Strings {}

extension Strings {
    enum Errors {}
    enum Titles {}
    enum Buttons {}
}

extension Strings.Buttons {
    static var clear: String {
        return NSLocalizedString("Clear", comment: "")
    }
}

extension Strings.Titles {
    static var topTvShows: String {
        return NSLocalizedString("Top 20 TV Shows", comment: "")
    }
    
    static var loading: String {
        return NSLocalizedString("Loading...", comment: "")
    }
    
    static var searchTVShowTitle: String {
        return NSLocalizedString("Search TV Show Title", comment: "")
    }
    
    static var viewOnImdb: String {
        return NSLocalizedString("View on IMDb", comment: "")
    }
    
    static var description: String {
        return NSLocalizedString("Description", comment: "")
    }
    
    static var rated: String {
        return NSLocalizedString("Rated", comment: "")
    }
    
    static var rating: String {
        return NSLocalizedString("Rating", comment: "")
    }
    
    static var seasons: String {
        return NSLocalizedString("Seasons", comment: "")
    }
    
    static var genres: String {
        return NSLocalizedString("Genres", comment: "")
    }
}

extension Strings.Errors {
    static var errorLoadingTVShows: String {
        return NSLocalizedString("There was a problem loading the TV shows.", comment: "")
    }
}
