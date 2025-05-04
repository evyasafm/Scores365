import Foundation

struct AssignmentResponseDTO: Decodable {
    let games: [GameDTO]
    let competitions: [CompetitionDTO]

    enum CodingKeys: String, CodingKey {
        case games = "Games"
        case competitions = "Competitions"
    }
}
