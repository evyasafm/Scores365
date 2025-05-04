//
//  GameTypes.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

// MARK: - Table Row
enum TableRow {
    case competition(name: String)
    case game(viewModel: GameCellViewModel)
}

// MARK: - Competition Section
struct CompetitionSection: Identifiable {
    let id: Int
    let name: String
    let games: [GameCellViewModel]
}

// MARK: - Date Section
struct DateSection: Identifiable {
    var id: Date { date }
    let date: Date
    private let competitions: [CompetitionSection]
    
    // Property to flatten the structure
    lazy var rows: [TableRow] = {
        competitions.flatMap { competition in
            [TableRow.competition(name: competition.name)] +
            competition.games.map { TableRow.game(viewModel: $0) }
        }
    }()
    
    init(date: Date, competitions: [CompetitionSection]) {
        self.date = date
        self.competitions = competitions
    }
} 
