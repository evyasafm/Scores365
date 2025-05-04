//
//  APIService.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

protocol APIService {
    func get<T: Decodable>(_ endpoint: String) async throws -> T
}

final class APIServiceImpl: APIService {
    private let baseURL = URL(string: "http://demo2170822.mockable.io/")!
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func get<T: Decodable>(_ endpoint: String) async throws -> T {
        let url = baseURL.appendingPathComponent(endpoint)
        let (data, response) = try await session.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
