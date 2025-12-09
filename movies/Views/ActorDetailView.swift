//
//  ActorDetailView.swift
//  movies
//
//  Created by Efrain Mouton on 02/12/2025.
//

import SwiftUI

struct ActorDetailView: View {
    @Environment(MovieDataStore.self) var movieDS
    var actor: Actor
    var body: some View {
        VStack {
            Text("Actor: \(actor.firstName) \(actor.lastName)").bold().foregroundStyle(.tint)
            Divider()
            Text("Birthday: \(actor.birthday)")
            Spacer()
            Divider()
            Text("Movie(s)").bold()
            ForEach(movieDS.getMovies(actor: actor), id: \.self) { movie in
                NavigationLink("\(movie.title)", value: Routes.movieType(movie)).foregroundStyle(.tint)
            }
            Spacer()
            Divider()
            PathView()
        }
    }
}
