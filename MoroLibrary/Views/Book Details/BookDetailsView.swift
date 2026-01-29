//
//  BookDetailsView.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 28/01/2026.
//

import SwiftUI

struct BookDetailsView: View {
    
    let book: Book
    @EnvironmentObject private var favoritesVM: FavoritesViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: book.coverURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                
                HStack {
                    Text(book.title)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    Button {
                        favoritesVM.toogleFavorite(bookID: book.id)
                    } label: {
                        Image(systemName: favoritesVM.isFavorite(bookID: book.id) ? "heart.fill" : "heart")
                            .foregroundStyle(.red)
                            .font(.title2)
                    }
                }
                
                Text(book.authorNames)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(book.summary)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

