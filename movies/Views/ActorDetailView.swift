//
//  ActorDetailView.swift
//  movies
//
//  Created by Efrain Mouton on 02/12/2025.
//

import SwiftUI

struct ActorDetailView: View {
    var actor: Actor
    var body: some View {
        Text("Hello \(actor.firstName)")
        PathView()
    }
}
