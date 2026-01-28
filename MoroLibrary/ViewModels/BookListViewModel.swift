//
//  BookListViewModel.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 28/01/2026.
//

import Foundation
import Combine

@MainActor
final class BookListViewModel: ObservableObject {
    
    @Published var books: [Book] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func loadBooks() async {
        
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            let response = try await NetworkingCall.shared.responseCall(
                url: Endpoints.books,
                responseType: BookResponse.self
            )
            books = response.results
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
