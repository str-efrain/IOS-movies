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
        NavigationStack(path: $pathStore.path) {
            if loading {
                ProgressView("Loading...")
            } else {
                List(movieDataStore.getMovies(), id: \.self, selection: $selectedMovie) { movie in
                    NavigationLink(value: Routes.movie(movie)){
                        VStack(alignment: .leading) {
                            Text(movie.title).bold()
                            Text(movie.description)
                            Divider()
                        }
                    }
                }.navigationDestination(for: Routes.self) { route in
                    switch route {
                        case let .actor(actor: actor):
                            ActorDetailView(actor: actor)
                    case let .director(director: director)
                        DirectorDetailView
                    }
                }
            }
        }.task {
            await movieDataStore.loadData()
            loading = false
        }
        
    }
}

