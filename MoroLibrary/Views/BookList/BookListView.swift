//
//  BookListView.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 28/01/2026.
//

import SwiftUI

struct BookListView: View {
    
    @StateObject private var viewModel = BookListViewModel()
    var body: some View {
        NavigationStack {
            List(viewModel.books) { book in
                NavigationLink(value: book) {
                    BookRowView(book: book)
                }
            }
            .navigationTitle("Books")
            .task {
                await viewModel.loadBooks()
            }
//            .navigationDestination(for: Book.self) { book in
//                BookDetailsListView(book: book)
//            }
        }
    }
}

#Preview {
    BookListView()
}
