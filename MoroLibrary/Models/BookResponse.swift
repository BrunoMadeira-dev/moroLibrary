//
//  BookResponse.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 28/01/2026.
//

import Foundation

struct BookResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Book]
}
