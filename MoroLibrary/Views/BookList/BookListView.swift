//
//  BookListView.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 28/01/2026.
//

import SwiftUI

struct BookListView: View {
    
    @ObservedObject var viewModel = BookListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.books) { book in
                NavigationLink(value: book) {
                    BookRowView(book: book)
                }
                .onAppear {
                    if book == viewModel.books.last {
                        Task {
                            await viewModel.loadNextPage()
                            
                        }
                    }
                }
                
                if viewModel.isLoading {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                }
            }
            .navigationTitle("Books")
            .navigationDestination(for: Book.self) { book in
                BookDetailsView(book: book)
            }
            .task {
                await viewModel.loadInitialBooks()
            }

        }
        .alert(item: $viewModel.uiError) { error in
            Alert(
                title: Text(error.title),
                message: Text(error.message),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}

#Preview {
    BookListView()
}
