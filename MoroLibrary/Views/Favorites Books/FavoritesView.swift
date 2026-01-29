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
            List {
                ForEach(
                    booksVM.books
                        .filter {
                            favoritesVM.isFavorite(bookID: $0.id)
                        }) { book in
                            NavigationLink(value: book) {
                            FavoritesRowView(book:book)
                        }
                    }
            }
            .navigationTitle("Favorites")
            .navigationDestination(for: Book.self) { book in
                BookDetailsView(book: book)
            }
        }
    }
}

#Preview {
    FavoritesView()
}
