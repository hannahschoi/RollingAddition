//
//  GameView.swift
//  Rolling Addition
//
//  Created by Hannah Choi on 2023-05-29.
//

import SwiftUI

/// View that displays the game screen, where the user can roll the dice and guess the sum
struct GameView: View {
    @ObservedObject var matchManager: MatchManager
    @State var guess = ""
    @State var dice1 = 1
    @State var dice2 = 1
    @State var correctGuess = false
    @State var canGuess = true
    
    var body: some View {
        ZStack {
        GeometryReader { geometry in
            VStack {
                Text("Score: \(matchManager.score)")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .position(x: 200, y: 40)
                Image("\(dice1)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .position(x: 100, y: 50)
                Image("\(dice2)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .position(x: 100, y: 120)
                
                // Roll button for dice 1
                Button {
                    roll1()
                    canGuess = true
                } label: {
                    Text("ROLL")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .padding(.vertical)
                }
                .frame(width: geometry.size.width * 0.4)
                .background(Color.orange)
                .cornerRadius(30)
                .position(x: 280, y: -255)
                
                // Roll button for dice 2
                Button {
                    roll2()
                    canGuess = true
                } label: {
                    Text("ROLL")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .padding(.vertical)
                }
                .frame(width: geometry.size.width * 0.4)
                .background(Color.orange)
                .cornerRadius(30)
                .position(x: 280, y: -185)
            }
            .background(Color.blue)
            .ignoresSafeArea(.keyboard)
            VStack {
                question
            }
        }
        
        // Display "correct image" for 3 seconds
        if correctGuess {
            Image("rollAgain")
                .scaleEffect(0.8)
                .position(x: 200, y: 400)
                .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    correctGuess = false
                    }
                }
            }
        }
    }

    var question: some View {
        VStack{
            Spacer()
            VStack {
                Text("What is \(dice1) + \(dice2) ?")
                   .font(.largeTitle)
                   .bold()
                   .padding()
                   .frame(maxWidth: .infinity)
                   .background(.orange)
            }
            HStack {
                TextField("Type your answer", text: $guess)
                    .padding()
                    .disabled(canGuess == false)
                    .background(
                        Capsule(style: .circular)
                            .fill(.white)
                    )
                    .keyboardType(.numberPad)
                
                // Button to submit answer
                Button {
                    answer()
                    // Clear textfield
                    guess = ""
                } label: {
                    Image(systemName: "chevron.right.circle.fill")
                    .renderingMode(.original)
                    .foregroundColor(.yellow)
                    .font(.system(size: 50))
                }
            }
            .frame(maxWidth: .infinity)
            .padding([.bottom, .horizontal], 30)
            .padding(.vertical)
            .background(.orange)
        }
    }
    
    /// A function that generates random numbers for dice 1
    func roll1() {
        matchManager.lastDice1 = .random(in: 1...6)
        dice1 = matchManager.lastDice1
    }
    
    /// A function that generates random numbers for dice 2
    func roll2() {
        matchManager.lastDice2 = .random(in: 1...6)
        dice2 = matchManager.lastDice2
    }
    
    /// A function that checks whether the user's input is correct or not
    func answer() {
        if !canGuess {
            return
        }
        if guess.isEmpty {
            return
        }
        if Int(guess) == (dice1 + dice2) {
            matchManager.score += 1
            correctGuess = true
            canGuess = false
        }
        else {
            matchManager.gameOver()
            correctGuess = false
        }
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(matchManager: MatchManager())
    }
}


