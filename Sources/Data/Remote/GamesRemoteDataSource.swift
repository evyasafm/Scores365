import Foundation

public protocol GamesRemoteDataSource {
    func fetchGames() async throws -> AssignmentResponseDTO
}

public final class GamesRemoteDataSourceImpl: GamesRemoteDataSource {
    private let api: APIService
    
    public init(api: APIService = .init()) {
        self.api = api
    }
    
    public func fetchGames() async throws -> AssignmentResponseDTO {
        try await api.getAssignment()
    }
} 