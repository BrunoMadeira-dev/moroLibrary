//
//  BooksRootView.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 28/01/2026.
//

import SwiftUI

struct BooksRootView: View {
    var body: some View {
        TabView {
            BookListView()
                .tabItem {
                    Label("Books", systemImage: "book")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
        
    }
}

#Preview {
    BooksRootView()
}
