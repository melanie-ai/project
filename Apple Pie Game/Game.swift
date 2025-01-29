//
//  Game.swift
//  Apple Pie Game
//
//  Created by Melanie Laveriano on 11/12/24.
//

import Foundation
struct Game {
var word: String
var incorrectMovesRemaining: Int
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            }
            else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }

var guessedLetters: [Character]
mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining += 1
        }
    }
    
    
}

