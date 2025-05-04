import Foundation
import Domain
import Data

@MainActor
public final class GamesViewModel: ObservableObject {
    @Published public private(set) var sections: [DateSection] = []
    @Published public private(set) var isLoading = false
    @Published public private(set) var error: String?
    
    private let getGames: GetGamesUseCase
    
    public init(getGames: GetGamesUseCase = .init()) {
        self.getGames = getGames
    }
    
    public func onAppear() {
        Task { await load() }
    }
    
    public func load() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let games = try await getGames.execute()
            sections = group(games: games)
        } catch {
            self.error = error.localizedDescription
        }
    }
    
    private func group(games: [Game]) -> [DateSection] {
        let grouped = Dictionary(grouping: games) { $0.date.startOfDay }
        return grouped.keys.sorted().map { date in
            let comps = Dictionary(grouping: grouped[date]!) { $0.competitionId }
            let compSections = comps.keys.sorted { $0 < $1 }.map { compId in
                CompetitionSection(
                    id: compId,
                    name: grouped[date]!.first { $0.competitionId == compId }!.competitionName,
                    games: comps[compId]!.sorted { $0.date < $1.date }
                )
            }
            return DateSection(date: date, competitions: compSections)
        }
    }
}

struct DateSection: Identifiable {
    var id: Date { date }
    let date: Date
    let competitions: [CompetitionSection]
}

struct CompetitionSection: Identifiable {
    let id: Int
    let name: String
    let games: [Game]
} 