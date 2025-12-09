//
//  DirectorDetailView.swift
//  movies
//
//  Created by Efrain Mouton on 04/12/2025.
//

import SwiftUI

struct DirectorDetailView: View {
    var director: Director
    @Environment(MovieDataStore.self) var movieDS
    var body: some View {
        VStack {
            Text("Director: \(director.firstName) \(director.lastName)").bold()
            Divider().foregroundStyle(.tint)
            Spacer()
            Divider().foregroundStyle(.tint)
            Text("Movie(s)").bold()
            ForEach(movieDS.getMovies(director: director), id: \.self) { movie in
                NavigationLink("\(movie.title)", value: Routes.movieType(movie)).foregroundStyle(.tint)
            }
            Spacer()
            Divider().foregroundStyle(.tint)
            Text("Actors work with:")
            ForEach(movieDS.getActors(director: director), id: \.self) { actor in
                NavigationLink("\(actor.firstName) \(actor.lastName)", value: Routes.actorType(actor)).foregroundStyle(.tint)
            }
            Spacer()
            PathView()
        }
    }
}

