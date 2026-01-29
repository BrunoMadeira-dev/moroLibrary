//
//  FavoritesView.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 28/01/2026.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject private var favoritesVM: FavoritesViewModel
    @EnvironmentObject private var booksVM: BookListViewModel
    
    var body: some View {
        NavigationStack {
            if favoritesVM.favoritebooksIDs.isEmpty {
                emptyState
            } else {
                favoritesList
                .navigationTitle("Favorites")
                .navigationDestination(for: Book.self) { book in
                    BookDetailsView(book: book)
                }
            }
        }
    }
    
    
    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart")
                .font(.system(size: 50))
                .foregroundStyle(.secondary)
            
            Text("No favorites yet.")
                .font(.headline)
            
            Text("Click on the heart icon in any book to add to your favorites!")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
    
    private var favoritesList: some View {
        List {
            ForEach(booksVM.books.filter {
                favoritesVM.isFavorite(bookID: $0.id)
            }) { book in
                NavigationLink(value: book) {
                    FavoritesRowView(book: book)
                }
            }
        }
    }
}

#Preview {
    FavoritesView()
}
