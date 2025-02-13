//
//  ContentView.swift
//  rock
//
//  Created by Melanie Laveriano on 2/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var playerChoice: Sign?
    @State private var computerChoice: Sign = .start
    @State private var gameState: GameState = .start

    func generateComputerChoice() -> Sign {
        let sign = Int.random(in: 0...2)
        if sign == 0
        {
            return .rock
        }
        else if sign == 1
        {
            return .paper
        }
        
        else{
            return .scissors
        }
    }
    
    func playGame(playerSign: Sign) {
        playerChoice = playerSign
        computerChoice = generateComputerChoice()
        gameState = playerSign.determineWin(against: computerChoice)
        
       
    }
    func resetGame() {
        playerChoice = nil
        computerChoice = .start
        gameState = .start
    }
            
    
    var body: some View {
        VStack{
            Text("Computer's Choice")
                .font(.headline)
            Text(computerChoice.emoji)
                .font(.system(size: 80))
                .padding()
            Text(gameState.message)
                .font(.title)
                .foregroundColor(.red)
                .padding()
            HStack{
                Button(action: { playGame(playerSign: .rock)}){
                    Text("🪨")
                        .font(.system(size: 60))
                }
                .disabled(gameState != .start)
                Button(action: { playGame(playerSign: .paper)}){
                    Text("📄")
                        .font(.system(size: 60))
                }
                .disabled(gameState != .start)
                Button(action: { playGame(playerSign: .scissors)}){
                    Text("✂️")
                        .font(.system(size: 60))
                }
                .disabled(gameState != .start)
                }
            }
        }
    }


#Preview {
    ContentView()
}





