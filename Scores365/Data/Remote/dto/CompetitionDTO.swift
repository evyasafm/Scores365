import Foundation

struct CompetitionDTO: Decodable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
    }
}
