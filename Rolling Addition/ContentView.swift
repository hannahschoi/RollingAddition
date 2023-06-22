//
//  ContentView.swift
//  Rolling Addition
//
//  Created by Hannah Choi on 2023-05-29.
//

import SwiftUI

/// View that organizes the nagivation between different screens in the game
struct ContentView: View {
    @StateObject var matchManager = MatchManager()
    var body: some View {
        ZStack {
            // Goes to game over screen
            if matchManager.isGameOver {
                GameOverView(matchManager: matchManager)
                
            // Goes to game screen
            } else if matchManager.inGame {
                GameView(matchManager: matchManager)
                
            // Goes to menu screen
            } else {
                MenuView(matchManager: matchManager)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


