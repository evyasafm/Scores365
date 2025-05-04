import Foundation
import Domain

#if DEBUG
extension Game {
    static let mock = Game(
        id: 1,
        statusId: 2,
        date: Date(),
        competitionId: 1,
        competitionName: "Premier League",
        isLive: false,
        liveMinute: 0,
        teams: [
            Competitor(id: 1, name: "Team A"),
            Competitor(id: 2, name: "Team B")
        ],
        score: [0, 0]
    )
}

extension DateSection {
    static let mock = DateSection(
        date: Date(),
        competitions: [
            CompetitionSection(
                id: 1,
                name: "Premier League",
                games: [.mock]
            )
        ]
    )
}
#endif 