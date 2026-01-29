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
    @Published var uiError: UIError?
    
    private var nextPageURL: String? = Endpoints.books
    private var isFetchingNextPage = false
    private let service: BookServiceProtocol
    

    init(service: BookServiceProtocol? = nil) {
        self.service = service ?? BooksService()
    }
    
    func loadInitialBooks() async {
        books = []
        nextPageURL = Endpoints.books
        await loadNextPage()
    }
    
    func loadNextPage() async {
        guard let url = nextPageURL,
              !isFetchingNextPage else { return }
        
        isFetchingNextPage = true
        isLoading = true
        
        defer {
            isFetchingNextPage = false
            isLoading = false
        }
        
        do {
            let response = try await service.fetchBooks(url: url)
            books.append(contentsOf: response.results)
            nextPageURL = response.next
        } catch {
            uiError = UIError(title: "Error", message: "Error loading more books")
        }
    }
}
