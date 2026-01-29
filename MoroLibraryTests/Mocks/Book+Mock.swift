//
//  Book+Mock.swift
//  MoroLibraryTests
//
//  Created by Bruno Madeira on 29/01/2026.
//

@testable import MoroLibrary
import Foundation


extension BookResponse {
    
    static var mockPage1: BookResponse {
     
        BookResponse(
            count:40,
            next: "page2",
            previous: nil,
            results:(1...20).map {
                Book(
                    id:$0,
                    title: "Book \($0)",
                    authors: [Author(name: "Author \($0)")],
                    summaries: ["teste", "teste2"],
                    formats: .init(imageJPEG: "https://placeholder.com/"))
            }
        )
    }
    
    static var mockPage2: BookResponse {
     
        BookResponse(
            count:40,
            next: nil,
            previous: "page1",
            results:(21...40).map {
                Book(
                    id:$0,
                    title: "Book \($0)",
                    authors: [Author(name: "Author \($0)")],
                    summaries: ["teste", "teste2"],
                    formats: .init(imageJPEG: "https://placeholder.com/"))
            }
        )
    }
}

