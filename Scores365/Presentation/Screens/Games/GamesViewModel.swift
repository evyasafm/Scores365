//
//  GamesViewModel.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation
import SwiftUI

@MainActor
final class GamesViewModel: ObservableObject {
    @Published private(set) var sections: [DateSection] = []
    @Published private(set) var isLoading = false
    @Published var error: String?

    private let getGames: GetGamesUseCase

    init(getGames: GetGamesUseCase = Assemblies.shared.getGamesUseCase) {
        self.getGames = getGames
    }

    func onAppear() {
        Task { await load() }
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let games = try await getGames.execute()
            sections = group(games: games)
        } catch {
            self.error = error.localizedDescription
        }
    }

    // MARK: - Grouping
    private func group(games: [Game]) -> [DateSection] {
        let grouped = Dictionary(grouping: games) { $0.date.startOfDay }
        return grouped.keys.sorted().map { date in
            let comps = Dictionary(grouping: grouped[date]!) { $0.competitionId }
            let compSections = comps.keys.sorted().map { compId in
                CompetitionSection(
                    id: compId,
                    name: grouped[date]!.first { $0.competitionId == compId }!.competitionName,
                    games: comps[compId]!.sorted { $0.date < $1.date }.map { GameViewModelFactory.createCellViewModel(from: $0) }
                )
            }
            return DateSection(date: date, competitions: compSections)
        }
    }
}
