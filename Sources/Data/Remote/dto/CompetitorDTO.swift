import Foundation

public struct CompetitorDTO: Decodable {
    public let id: Int
    public let name: String
    
    public enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
    }
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
} 