//
//  ContentView.swift
//  movies
//
//  Created by Efrain Mouton on 18/11/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(PathStore.self) var pathStore
    var body: some View {
        @Bindable var pathStore = pathStore
        @State var loading = true
        
        if loading {
            ProgressView()
        } else {
            NavigationStack(path: $pathStore.path) {
                
            }
        }
        
    }
}
