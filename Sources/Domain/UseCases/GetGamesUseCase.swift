import Foundation
import Data

public final class GetGamesUseCase {
    private let repo: GamesRepository
    
    public init(repo: GamesRepository = GamesRepositoryImpl()) {
        self.repo = repo
    }
    
    public func execute() async throws -> [Game] {
        try await repo.games()
    }
} 