//
//  FinishedGameCellViewModel.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

/// View model for a completed game
struct FinishedGameCellViewModel: GameCellViewModel {
    // MARK: - Properties
    
    /// Name of the first team
    let team1Name: String
    
    /// Name of the second team
    let team2Name: String
    
    /// Final score for team 1
    let score1: Int
    
    /// Final score for team 2
    let score2: Int
    
    // MARK: - GameCellViewModel
    
    /// Final score text in format "X - Y"
    var scoreText: String { "\(score1) - \(score2)" }
    
    /// Empty string as the game is finished
    var minuteText: String { "" }
}
