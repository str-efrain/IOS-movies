//
//  ContentView.swift
//  movies
//
//  Created by Efrain Mouton on 18/11/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(PathStore.self) var pathStore
    @Environment(MovieDataStore.self) var movieDataStore
    @State var selectedMovie: Movie?
    @State var loading = true
    var body: some View {
        @Bindable var pathStore = pathStore
        VStack{
            if loading {
                ProgressView("Loading...")
            } else {
                NavigationStack(path: $pathStore.path) {
                    List(movieDataStore.getMovies(), id: \.self, selection: $selectedMovie) { movie in
                        NavigationLink(value: Routes.movieType(movie)){
                            VStack(alignment: .leading) {
                                Text(movie.title).bold()
                                Text(movie.description).italic()
                            }
                        }
                    }.navigationDestination(for: Routes.self) { route in
                        switch route {
                        case let .actorType(actor):
                            ActorDetailView(actor: actor)
                        case let .directorType(director):
                            DirectorDetailView(director: director)
                        case let .movieType(movie):
                            MovieDetailView(movie: movie)
                        }
                    }
                }
            }
        }.task {
            await movieDataStore.loadData()
            loading = false
        }
    }
    
}
