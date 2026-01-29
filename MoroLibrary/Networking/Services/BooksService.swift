//
//  BooksService.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 29/01/2026.
//

import Foundation

final class BooksService: BookServiceProtocol {
    func fetchBooks(url: String) async throws -> BookResponse {
        try await NetworkingCall.shared
            .responseCall(
                url: url,
                responseType: BookResponse.self
            )
    }
}
