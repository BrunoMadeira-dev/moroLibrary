//
//  MockBookServices.swift
//  MoroLibraryTests
//
//  Created by Bruno Madeira on 29/01/2026.
//

@testable import MoroLibrary
import Foundation

final class MockBookServices: BookServiceProtocol {

    
    var result: Result<BookResponse, Error>!
    
    func fetchBooks(url: String) async throws -> BookResponse {
        try result.get()
    }
}
