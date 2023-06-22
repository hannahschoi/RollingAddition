//
//  GameOverView.swift
//  Rolling Addition
//
//  Created by Hannah Choi on 2023-05-29.
//

import SwiftUI

/// View that displays the game over screen
struct GameOverView: View {
    @ObservedObject var matchManager: MatchManager

    var body: some View {
        VStack {
            Text("Score: \(matchManager.score)")
                .font(.largeTitle)
                .bold()
                .position(x: 200 , y: 40)
                .foregroundColor(.black)
            Image("gameOver")
                .position(x: 200 , y: 60)
            Text("Nice try...but \(matchManager.lastDice1) + \(matchManager.lastDice2) = \(matchManager.lastDice1 + matchManager.lastDice2) ")
                .font(.system(size: 30))
                .bold()
                .foregroundColor(.black)
                .position(x: 200 , y: 80)

            // Menu button to return to start
            Button {
                matchManager.resetGame()
            } label: {
                Text("MENU")
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
            .position(x: 200, y: 80)
            Spacer()
        }
        .background(.white)
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(matchManager: MatchManager())
    }
}


