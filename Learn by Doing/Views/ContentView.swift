//
//  ContentView.swift
//  Learn by Doing
//
//  Created by Ivan Romero on 13/02/2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    // MARK: - FUNCTIONS
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cardData) { card in
                    CardView(card: card)
                }
            }
            .padding(20)
        }
        .scrollIndicators(.hidden)
    }
}

// MARK: - PREVIEW
#Preview {
    ContentView()
}
