//
//  CardView.swift
//  Learn by Doing
//
//  Created by Ivan Romero on 13/02/2024.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    let card: Card
    
    // MARK: - FUNCTIONS
    // MARK: - BODY
    var body: some View {
            VStack {
                VStack {
                    VStack {
                        Text(card.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                        Text(card.headline)
                            .foregroundStyle(.white)
                            .fontWeight(.light)
                            .italic()
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Text(card.callToAction.uppercased())
                                .fontWeight(.heavy)
                                .foregroundStyle(.white)
                            .tint(.white)
                            
                            Image(systemName: "arrow.right.circle")
                                .font(.title.weight(.medium))
                                .tint(.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 24)
                        .background(
                            LinearGradient(colors: card.gradientColors, startPoint: .leading, endPoint: .trailing)
                        )
                        .clipShape(Capsule())
                        .shadow(color: .accent, radius: 6, x: 0, y: 3)
                    }
                }
                .padding(.top, 25)
                .padding(.bottom, 40)
            }
            .frame(width: 335, height: 545, alignment: .center)
            .background(Image(card.imageName))
            .background(LinearGradient(colors: card.gradientColors, startPoint: .top, endPoint: .bottom))
            .clipShape(.rect(cornerRadius: 16))
            .shadow(radius: 8)
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    CardView(card: cardData[5])
        .padding()
}
