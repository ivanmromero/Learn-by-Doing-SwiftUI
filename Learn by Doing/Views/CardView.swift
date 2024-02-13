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
    let hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    @State private var fadeIn: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert:Bool = false
    
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
                .offset(y: moveDownward ? 0 : -30)
                
                Spacer()
                
                Button {
                    playSound(sound: "sound-chime", type: "mp3")
                    hapticImpact.impactOccurred()
                    showAlert.toggle()
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
                .offset(y: moveUpward ? 0 : 30)
            }
            .padding(.top, 25)
            .padding(.bottom, 40)
        }
        .frame(width: 335, height: 545, alignment: .center)
        .background(
            Image(card.imageName)
                .opacity(fadeIn ? 1 : 0)
        )
        .background(LinearGradient(colors: card.gradientColors, startPoint: .top, endPoint: .bottom))
        .clipShape(.rect(cornerRadius: 16))
        .shadow(radius: 8)
        .onAppear(perform: {
            withAnimation(.linear(duration: 1.2)) {
                fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                moveDownward.toggle()
                moveUpward.toggle()
            }
        })
        .alert(card.title, isPresented: $showAlert, actions: {
            Button("OK", role: .cancel, action: {})
        }, message: {
            Text(card.message)
        })
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    CardView(card: cardData[5])
        .padding()
}
