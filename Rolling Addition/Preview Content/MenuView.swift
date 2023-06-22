//
//  MenuView.swift
//  Rolling Addition
//
//  Created by Hannah Choi on 2023-05-29.
//

import SwiftUI

/// View that displays the menu screen at the start of the game
struct MenuView: View {
    @ObservedObject var matchManager: MatchManager
    
    var body: some View {
        VStack {
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFit()
                .padding(30)
            Spacer()
            
            // Play button to start the game
            Button {
                matchManager.startGame()
            } label: {
                Text("PLAY")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 100)
            .background(
                Capsule(style: .circular)
                    .fill(.yellow)
            )
            Spacer()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(matchManager: MatchManager())
    }
}


