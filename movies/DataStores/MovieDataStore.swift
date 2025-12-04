//
//  MovieDataStore.swift
//  movies
//
//  Created by Efrain Mouton on 18/11/2025.
//

import Foundation

@Observable
class MovieDataStore {
    private var movies = Movies()
    
    init(){
        
       
    }
    
    func getMovies() -> [Movie] {
        return movies.movies
    }
    
    func getMovies(actor: Actor) -> [Movie] {
        let movies = movies.movies
        return movies.filter { movie in
            movie.actors.contains(actor)
        }
    }
    
    func getMovies(director: Director) -> [Movie] {
        let movies = movies.movies
        return movies.filter { movie in
            movie.director == director
        }
    }
    
    func getActors(director: Director) -> [Actor] {
        let movies = movies.movies
        
        var actors: [Actor] = []  
        for movie in movies where movie.director == director {
            actors.append(contentsOf: movie.actors)
        }
        
        return actors
    }

    
    private func sort() {
        movies.movies = movies.movies.sorted()
    }
    
    func loadData() async {
        //simulate async call
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            // load movies
            movies = try load("movies.json")
            // sort
            sort()
            print("✅ Data loaded successfully.")
            
        } catch {
            print("❌ Failed to load uurrooster:", error)
            //movies is lege array
            
            movies.movies = []
        }
    }
}
