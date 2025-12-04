//
//  PathView.swift
//  movies
//
//  Created by Efrain Mouton on 04/12/2025.
//

import SwiftUI

struct PathView: View {
    @Environment(PathStore.self) var pathStore
    var body: some View {
        VStack{
            Text("Overview navigationStack")
            ForEach(pathStore.path.enumerated(), id: \.offset) { index, pathElement in
                Button("\(pathElement)") {
                    pathStore.path = Array(pathStore.path.prefix(index + 1))
                }
            }
            Button("Clear") {
                pathStore.path = [Routes]()
            }
        }
    }
}

#Preview {
    PathView()
}
