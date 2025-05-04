//
//  Game.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

// MARK: - Game Types

/// Represents a team or participant in a game
struct Competitor {
    /// Unique identifier for the competitor
    let id: Int
    
    /// Display name of the competitor
    let name: String
}

/// Represents the current status of a game
enum GameStatus {
    /// Game hasn't started yet
    case future
    
    /// Game is currently in progress
    /// - Parameter minute: Current game minute
    case live(minute: Int)
    
    /// Game has finished
    case finished
}

/// Represents a sports game with its associated data
///
/// A game can be in one of three states:
/// - Future: The game hasn't started yet
/// - Live: The game is currently being played
/// - Finished: The game has ended
///
/// Example:
/// ```swift
/// let game = Game(
///     id: 1,
///     statusId: 2,
///     date: Date(),
///     competitionId: 99,
///     competitionName: "Premier League",
///     isLive: false,
///     liveMinute: 0,
///     teams: [
///         Competitor(id: 1, name: "Team A"),
///         Competitor(id: 2, name: "Team B")
///     ],
///     score: [0, 0]
/// )
/// ```
struct Game: Identifiable {
    /// Unique identifier for the game
    let id: Int
    
    /// Status identifier
    /// - 2: Future game
    /// - 3: Finished game
    let statusId: Int
    
    /// Scheduled date of the game
    let date: Date
    
    /// Identifier of the competition this game belongs to
    let competitionId: Int
    
    /// Name of the competition (e.g., "Premier League")
    let competitionName: String
    
    /// Whether the game is currently live
    let isLive: Bool
    
    /// Current minute of the game if it's live
    let liveMinute: Int
    
    /// Array of two competitors (home and away teams)
    let teams: [Competitor]
    
    /// Current score [home, away]
    let score: [Int]
}

// MARK: - Game Status Computation
extension Game {
    /// Computed property that returns the current game status
    var status: GameStatus {
        if isLive {
            return .live(minute: liveMinute)
        } else if statusId == 3 {
            return .finished
        } else {
            return .future
        }
    }
}
