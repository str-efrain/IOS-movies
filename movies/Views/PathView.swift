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
            Divider().foregroundStyle(.tint)
            Text("Overview navigationStack")
            ForEach(pathStore.path.enumerated(), id: \.offset) { index, pathElement in
                switch pathElement {
                    case let .actorType(pathElement):
                        Button("\(pathElement.firstName) \(pathElement.lastName)") {
                            pathStore.path = Array(pathStore.path.prefix(index + 1))
                        }
                    case let .directorType(pathElement):
                        Button("\(pathElement.firstName) \(pathElement.lastName)") {
                            pathStore.path = Array(pathStore.path.prefix(index + 1))
                        }
                    case let .movieType(pathElement):
                        Button("\(pathElement.title)") {
                            pathStore.path = Array(pathStore.path.prefix(index + 1))
                        }
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
