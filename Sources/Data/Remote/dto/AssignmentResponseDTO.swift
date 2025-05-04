import Foundation

public struct AssignmentResponseDTO: Decodable {
    public let games: [GameDTO]
    public let competitions: [CompetitionDTO]
    
    public enum CodingKeys: String, CodingKey {
        case games = "Games"
        case competitions = "Competitions"
    }
    
    public init(games: [GameDTO], competitions: [CompetitionDTO]) {
        self.games = games
        self.competitions = competitions
    }
} 