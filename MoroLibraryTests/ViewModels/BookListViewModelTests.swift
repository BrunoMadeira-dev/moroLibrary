//
//  BookListViewModelTests.swift
//  MoroLibraryTests
//
//  Created by Bruno Madeira on 29/01/2026.
//

import XCTest
@testable import MoroLibrary

@MainActor

final class BookListViewModelTests: XCTestCase {
    
    func testLoadInitialBookSuccess() async {
        
        let mockService = MockBookServices()
        
        mockService.result = .success(.mockPage1)
        
        let vm = BookListViewModel(service: mockService)
        
        await vm.loadInitialBooks()
        
        XCTAssertEqual(vm.books.count, 20)
        XCTAssertNil(vm.uiError)
        XCTAssertEqual(vm.books.first?.title, "Book 1")
        XCTAssertEqual(vm.books.last?.title, "Book 20")
    }
}
