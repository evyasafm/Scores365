//
//  GameMapper.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

enum GameMapper {
    static func map(dto: GameDTO,
                    competitions: [CompetitionDTO]) -> Game {
        let compName = competitions
            .first { $0.id == dto.comp }?.name ?? ""
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        let date = formatter.date(from: dto.sTime) ??
                   ISO8601DateFormatter().date(from: dto.sTime) ??
                   Date()

        return Game(
            id: dto.id,
            statusId: dto.stid,
            date: date,
            competitionId: dto.comp,
            competitionName: compName,
            isLive: dto.active,
            liveMinute: dto.gt,
            teams: dto.comps.map { Competitor(id: $0.id, name: $0.name) },
            score: Array(dto.scrs.prefix(2))
        )
    }
}
