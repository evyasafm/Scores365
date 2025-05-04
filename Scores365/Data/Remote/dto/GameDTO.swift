import Foundation

struct GameDTO: Decodable {
    let id: Int
    let stid: Int
    let sTime: String
    let comp: Int
    let active: Bool
    let gt: Int
    let comps: [CompetitorDTO]
    let scrs: [Int]

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case stid = "STID"
        case sTime = "STime"
        case comp = "Comp"
        case active = "Active"
        case gt = "GT"
        case comps = "Comps"
        case scrs = "Scrs"
    }
}
