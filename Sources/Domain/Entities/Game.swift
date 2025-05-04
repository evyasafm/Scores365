import Foundation

struct Game: Identifiable {
    let id: Int
    let statusId: Int
    let date: Date
    let competitionId: Int
    let competitionName: String
    let isLive: Bool
    let liveMinute: Int
    let teams: [Competitor]
    let score: [Int]
} 