//
//  GamesRemoteDataSource.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

protocol GamesRemoteDataSource {
    func fetchGames() async throws -> AssignmentResponseDTO
}

final class GamesRemoteDataSourceImpl: GamesRemoteDataSource {
    private let api: any APIService

    init(api: any APIService) {
        self.api = api
    }

    func fetchGames() async throws -> AssignmentResponseDTO {
        try await api.get("assignment")
    }
}
