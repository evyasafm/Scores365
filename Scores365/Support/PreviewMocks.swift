import Foundation

enum PreviewMocks {
    static let sampleGame = Game(
        id: 1,
        statusId: 2,
        date: Date(),
        competitionId: 99,
        competitionName: "Friendly League",
        isLive: false,
        liveMinute: 0,
        teams: [
            Competitor(id: 1, name: "Foo FC"),
            Competitor(id: 2, name: "Bar United")
        ],
        score: [0, 0]
    )
}
