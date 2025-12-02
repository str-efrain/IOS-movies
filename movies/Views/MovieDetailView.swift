//
//  MovieDetailView.swift
//  movies
//
//  Created by Efrain Mouton on 02/12/2025.
//

import SwiftUI

struct MovieDetailView: View {
    var selectedMovie: Movie
    var body: some View {
        Text(selectedMovie.title)
    }
}
