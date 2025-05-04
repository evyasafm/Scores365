//
//  GameCellViewModel.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

// MARK: - Base Protocol

/// Protocol defining the view model for a game cell
///
/// This protocol provides a common interface for different game states:
/// - Live games (showing current score and minute)
/// - Finished games (showing final score)
/// - Future games (showing scheduled time)
protocol GameCellViewModel {
    /// Name of the first team
    var team1Name: String { get }
    
    /// Name of the second team
    var team2Name: String { get }
    
    /// Score text to display (e.g., "2 - 1" or "14:30")
    var scoreText: String { get }
    
    /// Additional text to display (e.g., "45'" for live games)
    var minuteText: String { get }
}
