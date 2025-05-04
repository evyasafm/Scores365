import Foundation
import Domain

public enum GameMapper {
    public static func map(dto: GameDTO, competitions: [CompetitionDTO]) -> Game {
        let compName = competitions
            .first { $0.id == dto.comp }?.name ?? "Unknown"
        
        return Game(
            id: dto.id,
            statusId: dto.stid,
            date: ISO8601DateFormatter().date(from: dto.sTime)!,
            competitionId: dto.comp,
            competitionName: compName,
            isLive: dto.active,
            liveMinute: dto.gt,
            teams: dto.comps.map { Competitor(id: $0.id, name: $0.name) },
            score: Array(dto.scrs.prefix(2))
        )
    }
} 