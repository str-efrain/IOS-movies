//
//  Director.swift
//  movies
//
//  Created by Efrain Mouton on 18/11/2025.
//

import Foundation

struct Director: Codable, Hashable {
    var firstName: String
    var lastName: String
    var moviesDirected: [String]
}
