//
//  MatchManager.swift
//  Rolling Addition
//
//  Created by Hannah Choi on 2023-05-29.
//

import Foundation

/// Class that organizes the logic and state of the game
class MatchManager: ObservableObject {
    @Published var inGame = false
    @Published var isGameOver = false
    @Published var score = 0
    @Published var lastDice1: Int = 1
    @Published var lastDice2: Int = 1
    
    /// A function that starts the game
    func startGame() {
        inGame = true
    }
    
    /// A function that ends the game
    func gameOver() {
        isGameOver = true
    }
    
    /// A function that resets the gane
    func resetGame(){
        isGameOver = false
        inGame = false
        score = 0
    }
}


