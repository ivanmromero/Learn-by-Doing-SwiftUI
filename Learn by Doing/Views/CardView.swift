//
//  CardView.swift
//  Learn by Doing
//
//  Created by Ivan Romero on 13/02/2024.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    let gradient: [Color] = [.color01, .color02]
    
    // MARK: - FUNCTIONS
    // MARK: - BODY
    var body: some View {
            VStack {
                VStack {
                    VStack {
                        Text("SwiftUI")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                        Text("Better apps. Less code.")
                            .foregroundStyle(.white)
                            .fontWeight(.light)
                            .italic()
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Text("Learn".uppercased())
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
                            LinearGradient(colors: gradient, startPoint: .leading, endPoint: .trailing)
                        )
                        .clipShape(Capsule())
                        .shadow(color: .accent, radius: 6, x: 0, y: 3)
                    }
                }
                .padding(.top, 25)
                .padding(.bottom, 40)
            }
            .frame(width: 335, height: 545, alignment: .center)
            .background(Image("developer-no1"))
            .background(LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom))
            .clipShape(.rect(cornerRadius: 16))
            .shadow(radius: 8)
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    CardView()
        .padding()
}
