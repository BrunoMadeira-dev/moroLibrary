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
    
    private var nextPageURL: String? = Endpoints.books
    private var isFetchingNextPage = false
    
    func loadInitialBooks() async {
        books = []
        nextPageURL = Endpoints.books
        await loadNextPage()
    }
    
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
            let response = try await NetworkingCall.shared.responseCall(
                url: url,
                responseType: BookResponse.self
            )
            
            books.append(contentsOf: response.results)
            nextPageURL = response.next
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
