//
//  Protocols.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 29/01/2026.
//

import Foundation

protocol BookServiceProtocol {
    func fetchBooks(url: String) async throws -> BookResponse
}
