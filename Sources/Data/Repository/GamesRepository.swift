import Foundation
import Domain

public protocol GamesRepository {
    func games() async throws -> [Game]
}

public final class GamesRepositoryImpl: GamesRepository {
    private let remote: GamesRemoteDataSource
    
    public init(remote: GamesRemoteDataSource = GamesRemoteDataSourceImpl()) {
        self.remote = remote
    }
    
    public func games() async throws -> [Game] {
        let dto = try await remote.fetchGames()
        return dto.games.map { GameMapper.map(dto: $0, competitions: dto.competitions) }
    }
} 