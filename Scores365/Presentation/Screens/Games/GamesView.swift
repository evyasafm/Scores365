//
//  GamesView.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import SwiftUI

struct GamesView: View {
    @StateObject private var vm = GamesViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if vm.isLoading {
                    ProgressView("Loading…")
                } else {
                    UITableViewWrapper(sections: vm.sections)
                        .ignoresSafeArea(edges: .horizontal)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("365Scores")
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

#Preview {
    GamesView()
}
