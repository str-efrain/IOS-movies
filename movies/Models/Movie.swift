//
//  Movie.swift
//  movies
//
//  Created by Efrain Mouton on 18/11/2025.
//

import Foundation

struct Movie: Codable, Hashable, Comparable {
    var title: String
    var description: String
    var actors: [Actor]
    var director: Director
    var releaseDate: String
    
    static func < (lhs: Movie, rhs: Movie) -> Bool {
            lhs.title < rhs.title   // or compare by releaseDate if preferred
        }
}
