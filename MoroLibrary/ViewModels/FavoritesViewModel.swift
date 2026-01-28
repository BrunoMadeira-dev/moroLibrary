//
//  FavoritesViewModel.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 28/01/2026.
//

import Foundation
import Combine

@MainActor
final class FavoritesViewModel: ObservableObject {
    
    @Published private(set) var favoritebooksIDs: Set<Int> = []
    
    func toogleFavorite(bookID: Int) {
        if favoritebooksIDs.contains(bookID) {
            favoritebooksIDs.remove(bookID)
        } else {
            favoritebooksIDs.insert(bookID)
        }
    }
    
    func isFavorite(bookID: Int) -> Bool {
        favoritebooksIDs.contains(bookID)
    }
}
