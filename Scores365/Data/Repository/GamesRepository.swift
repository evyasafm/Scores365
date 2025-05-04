//
//  GamesRepository.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

protocol GamesRepository {
    func games() async throws -> [Game]
}
