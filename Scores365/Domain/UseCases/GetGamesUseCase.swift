//
//  GetGamesUseCase.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

final class GetGamesUseCase {
    private let repo: any GamesRepository

    init(repo: any GamesRepository) {
        self.repo = repo
    }

    func execute() async throws -> [Game] {
        try await repo.games()
    }
}
