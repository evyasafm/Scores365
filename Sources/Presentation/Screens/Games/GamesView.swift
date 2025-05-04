import SwiftUI
import Domain
import Data

public struct GamesView: View {
    @StateObject private var vm = GamesViewModel()
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            Group {
                if vm.isLoading {
                    ProgressView("Loading...")
                } else {
                    GamesListView(sections: vm.sections)
                }
            }
            .navigationTitle("Games")
            .task { vm.onAppear() }
            .alert("Error", isPresented: Binding(
                get: { vm.error != nil },
                set: { _ in vm.error = nil })
            ) {
                Button("OK") { }
            } message: {
                Text(vm.error ?? "")
            }
        }
    }
}

private struct GamesListView: View {
    let sections: [DateSection]
    
    var body: some View {
        List {
            ForEach(sections) { dateSection in
                DateSectionView(dateSection: dateSection)
            }
        }
        .listStyle(.grouped)
    }
}

private struct DateSectionView: View {
    let dateSection: DateSection
    
    var body: some View {
        Section(header: SectionHeaderView(date: dateSection.date)) {
            ForEach(dateSection.competitions) { comp in
                CompetitionSectionView(competition: comp)
            }
        }
    }
}

private struct CompetitionSectionView: View {
    let competition: CompetitionSection
    
    var body: some View {
        Section(header: Text(competition.name).font(.headline)) {
            ForEach(competition.games) { game in
                GameRowView(game: game)
            }
        }
    }
} 