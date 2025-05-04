import Foundation

// MARK: - Domain Models
public struct Game: Identifiable {
    public let id: Int
    public let statusId: Int
    public let date: Date
    public let competitionId: Int
    public let competitionName: String
    public let isLive: Bool
    public let liveMinute: Int
    public let teams: [Competitor]
    public let score: [Int]
    
    public init(id: Int, statusId: Int, date: Date, competitionId: Int, competitionName: String, isLive: Bool, liveMinute: Int, teams: [Competitor], score: [Int]) {
        self.id = id
        self.statusId = statusId
        self.date = date
        self.competitionId = competitionId
        self.competitionName = competitionName
        self.isLive = isLive
        self.liveMinute = liveMinute
        self.teams = teams
        self.score = score
    }
}

public struct Competitor: Identifiable {
    public let id: Int
    public let name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

public struct Competition: Identifiable {
    public let id: Int
    public let name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

// MARK: - View Models
public struct DateSection: Identifiable {
    public var id: Date { date }
    public let date: Date
    public let competitions: [CompetitionSection]
    
    public init(date: Date, competitions: [CompetitionSection]) {
        self.date = date
        self.competitions = competitions
    }
}

public struct CompetitionSection: Identifiable {
    public let id: Int
    public let name: String
    public let games: [Game]
    
    public init(id: Int, name: String, games: [Game]) {
        self.id = id
        self.name = name
        self.games = games
    }
} 