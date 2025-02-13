//
//  rockApp.swift
//  rock
//
//  Created by Melanie Laveriano on 2/6/25.
//
enum GameState: CaseIterable{
    case start, win, lose, draw
    var message: String {
        switch self {
        case .start: return "Choose your move!"
        case .win: return "You won! 🎉"
        case .lose: return "You lost! 😢"
        case .draw: return "It's a draw! 🤝"
        }
    }
}
enum Sign: CaseIterable {
    case rock, paper, scissors, start
    
    var emoji: String {
        switch self {
        case .rock: return "🪨"
        case .paper: return "📄"
        case .scissors: return "✂️"
        case .start: return "💻"
        }
    }
        
        func determineWin(against opponent: Sign) -> GameState {
            switch (self, opponent) {
            case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
                return .win
            case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
                return .draw
            default:
                return .lose
            }
        }
    }


    
