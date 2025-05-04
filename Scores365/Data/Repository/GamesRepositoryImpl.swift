//
//  GamesRepositoryImpl.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

final class GamesRepositoryImpl: GamesRepository {
    private let remote: any GamesRemoteDataSource

    init(remote: any GamesRemoteDataSource) {
        self.remote = remote
    }

    func games() async throws -> [Game] {
        let dto = try await remote.fetchGames()
        return dto.games.map { GameMapper.map(dto: $0, competitions: dto.competitions) }
    }
}
