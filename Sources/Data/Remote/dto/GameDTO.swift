import Foundation

public struct GameDTO: Decodable {
    public let id: Int
    public let stid: Int
    public let sTime: String
    public let comp: Int
    public let active: Bool
    public let gt: Int
    public let comps: [CompetitorDTO]
    public let scrs: [Int]
    
    public enum CodingKeys: String, CodingKey {
        case id = "ID"
        case stid = "STID"
        case sTime = "STime"
        case comp = "Comp"
        case active = "Active"
        case gt = "GT"
        case comps = "Comps"
        case scrs = "Scrs"
    }
    
    public init(id: Int, stid: Int, sTime: String, comp: Int, active: Bool, gt: Int, comps: [CompetitorDTO], scrs: [Int]) {
        self.id = id
        self.stid = stid
        self.sTime = sTime
        self.comp = comp
        self.active = active
        self.gt = gt
        self.comps = comps
        self.scrs = scrs
    }
} 