//
//  moviesApp.swift
//  movies
//
//  Created by Efrain Mouton on 18/11/2025.
//

import SwiftUI

@main
struct moviesApp: App {
    @State var movieDataStore = MovieDataStore()
    @State var pathStore = PathStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(movieDataStore).environment(pathStore)
        }
    }
}
