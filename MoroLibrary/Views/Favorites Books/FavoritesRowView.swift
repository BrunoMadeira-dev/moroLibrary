//
//  FavoritesRowView.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 29/01/2026.
//

import SwiftUI

struct FavoritesRowView: View {
    
    let book: Book
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: book.coverURL) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 75)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(book.title)
                    .font(.headline)
                
                Text(book.authorNames)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
