//
//  DirectorDetailView.swift
//  movies
//
//  Created by Efrain Mouton on 04/12/2025.
//

import SwiftUI

struct DirectorDetailView: View {
    var director: Director
    var body: some View {
        Text("Hello, \(director)")
        PathView()
    }
}

