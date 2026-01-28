//
//  MoroLibraryApp.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 28/01/2026.
//

import SwiftUI

@main
struct MoroLibraryApp: App {
    
    @StateObject private var favoritesViewModel = FavoritesViewModel()
    
    var body: some Scene {
        WindowGroup {
            BooksRootView()
                .environmentObject(favoritesViewModel)
        }
    }
}
