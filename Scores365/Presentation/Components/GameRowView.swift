//
//  GameRowView.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import SwiftUI

struct GameRowView: View {
    let game: Game

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(game.teams[0].name) – \(game.teams[1].name)")
                    .fontWeight(.medium)

                switch gameState {
                case .future(let date):
                    Text(date, style: .time)
                        .foregroundColor(.secondary)
                case .live(let score, let minute):
                    Text("\(score.0)-\(score.1)  •  \(minute)'")
                        .foregroundColor(.red)
                case .finished(let score):
                    Text("\(score.0)-\(score.1)")
                        .foregroundColor(.primary)
                }
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }

    private var gameState: GameState {
        if game.statusId == 2 { return .future(game.date) }
        if game.isLive { return .live((game.score[0], game.score[1]), game.liveMinute) }
        return .finished((game.score[0], game.score[1]))
    }

    enum GameState {
        case future(Date), live((Int, Int), Int), finished((Int, Int))
    }
}

struct GameRowView_Previews: PreviewProvider {
    static var previews: some View {
        GameRowView(game: PreviewMocks.sampleGame)
    }
}
