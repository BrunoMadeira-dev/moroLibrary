//
//  Book.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 28/01/2026.
//

import Foundation


struct Book: Codable, Identifiable, Hashable {
    
    let id: Int
    let title: String
    let authors: [Author]
    let summaries: [String]?
    let formats: Formats
    
    var authorNames: String {
        authors.map { $0.name }.joined(separator: ", ")
    }
    
    var summary: String {
        summaries?.first ?? "No summary available"
    }
    
    var coverURL: URL? {
        URL(string: formats.imageJPEG)
    }
}

struct Author: Codable, Hashable {
    let name: String
}

struct Formats: Codable, Hashable {
    let imageJPEG: String
    
    enum CodingKeys: String, CodingKey {
        case imageJPEG = "image/jpeg"
    }
    
    init(imageJPEG: String) {
        self.imageJPEG = imageJPEG
    }
}
