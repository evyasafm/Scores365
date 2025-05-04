//
//  FutureGameCellViewModel.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

/// View model for an upcoming game
struct FutureGameCellViewModel: GameCellViewModel {
    // MARK: - Properties
    
    /// Name of the first team
    let team1Name: String
    
    /// Name of the second team
    let team2Name: String
    
    /// Scheduled date of the game
    let date: Date
    
    // MARK: - GameCellViewModel
    
    /// Scheduled time in "HH:mm" format
    var scoreText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    /// Empty string as the game hasn't started
    var minuteText: String { "" }
}
