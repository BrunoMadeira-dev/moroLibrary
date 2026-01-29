//
//  BooksRootView.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 28/01/2026.
//

import SwiftUI

struct BooksRootView: View {
    
    @StateObject private var booksViewModel = BookListViewModel()
    
    var body: some View {
        TabView {
            BookListView(viewModel: booksViewModel)
                .tabItem {
                    Label("Books", systemImage: "book")
                }
            
            FavoritesView()
                .environmentObject(booksViewModel)
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
        
    }
}

#Preview {
    BooksRootView()
}
