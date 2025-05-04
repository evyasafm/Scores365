//
//  Assemblies.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

/// Simple Dependency Injection container placeholder.
struct Assemblies {
    static let shared = Assemblies()
    
    // MARK: - Services
    private let urlSession: URLSession = .shared
    
    var apiService: any APIService {
        APIServiceImpl(session: urlSession)
    }
    
    // MARK: - Data Sources
    var gamesRemoteDataSource: any GamesRemoteDataSource {
        GamesRemoteDataSourceImpl(api: apiService)
    }
    
    // MARK: - Repositories
    var gamesRepository: any GamesRepository {
        GamesRepositoryImpl(remote: gamesRemoteDataSource)
    }
    
    // MARK: - Use Cases
    var getGamesUseCase: GetGamesUseCase {
        GetGamesUseCase(repo: gamesRepository)
    }
    
    private init() {}
}
