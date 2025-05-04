//
//  GameViewModelFactory.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

struct GameViewModelFactory {
    static func createCellViewModel(from game: Game) -> GameCellViewModel {
        switch game.status {
        case .live(let minute):
            return LiveGameCellViewModel(
                team1Name: game.teams[0].name,
                team2Name: game.teams[1].name,
                score1: game.score[0],
                score2: game.score[1],
                minute: minute
            )
        case .finished:
            return FinishedGameCellViewModel(
                team1Name: game.teams[0].name,
                team2Name: game.teams[1].name,
                score1: game.score[0],
                score2: game.score[1]
            )
        case .future:
            return FutureGameCellViewModel(
                team1Name: game.teams[0].name,
                team2Name: game.teams[1].name,
                date: game.date
            )
        }
    }
} 