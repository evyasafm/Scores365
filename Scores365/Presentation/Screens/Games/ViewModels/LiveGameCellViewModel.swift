//
//  LiveGameCellViewModel.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

/// View model for a game that is currently being played
struct LiveGameCellViewModel: GameCellViewModel {
    // MARK: - Properties
    
    /// Name of the first team
    let team1Name: String
    
    /// Name of the second team
    let team2Name: String
    
    /// Current score for team 1
    let score1: Int
    
    /// Current score for team 2
    let score2: Int
    
    /// Current minute of the game
    let minute: Int
    
    // MARK: - GameCellViewModel
    
    /// Score text in format "X - Y"
    var scoreText: String { "\(score1) - \(score2)" }
    
    /// Current minute with apostrophe
    var minuteText: String { "\(minute)'" }
}
