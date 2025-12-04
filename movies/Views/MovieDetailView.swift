//
//  MovieDetailView.swift
//  movies
//
//  Created by Efrain Mouton on 02/12/2025.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    var body: some View {
        VStack{
            Text(movie.title).font(.title).foregroundStyle(.tint)
            Text(movie.description)
            Divider()
            Spacer()
            Text("Actors").bold()
            ForEach(movie.actors, id: \.self) { actor in
                NavigationLink("\(actor.firstName) \(actor.lastName)", value: Routes.actorType(actor)).foregroundStyle(.tint)
            }
            Divider()
            NavigationLink("\(movie.director.firstName) \(movie.director.lastName)", value: Routes.directorType(movie.director)).foregroundStyle(.tint)
            Spacer().foregroundStyle(.tint)
            PathView()
        }
        
    }
}
